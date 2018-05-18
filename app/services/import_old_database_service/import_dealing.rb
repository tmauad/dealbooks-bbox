# frozen_string_literal: true

class ImportOldDatabaseService
  class ImportDealing
    def run
      ImportOldDatabaseService::Entities::Dealing.find_each do |dealing|
        printf('.')
        @dealing = dealing

        next if dealing.deal_id.nil?

        @old_deal = Entities::Deal.find(dealing.deal_id)

        if dealing.buyer_type == 'Investor'
          @buyer = Entities::Investor.find(dealing.buyer_id) rescue nil

          next if @buyer.nil?
        elsif dealing.buyer_type == 'Company'
          @buyer = Entities::Company.find(dealing.buyer_id)
        else
          raise
        end

        @person = ::Person.find_by(permalink: @buyer.slug)
        @company = ::Company.find_by(permalink: @buyer.slug)

        @investor = (@person || @company).investor

        if @investor.nil?
          @investor = Investor.create!(investable: (@person || @company))
        end

        # achar o deal no lado do novo pelas informações do deal antigo
        @new_deal = ::Deal.find_by!(
          close_date: @old_deal.close_date,
          company_id: company(@old_deal).id
        )

        @deal_investor = DealInvestor.new(deal: @new_deal, investor: @investor)

        @deal_investor.save!
      end

      warn "\nImported deal_investor - final statistics"
      warn("count: #{::DealInvestor.count} deal_investors")
    rescue => e
      require 'pry'; binding.pry

      raise
    end

    private

    def company(deal)
      company_name = ImportOldDatabaseService::Entities::Company
        .find(deal.company_id)
        .name

      company = ::Company.find_by!(name: company_name)
    end
  end
end

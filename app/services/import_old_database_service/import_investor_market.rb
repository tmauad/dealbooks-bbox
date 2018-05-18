# frozen_string_literal: true

class ImportOldDatabaseService
  class ImportInvestorMarket
    def run
      @company_market_count_before = ::CompanyMarket.count

      ImportOldDatabaseService::Entities::InvestorMarket.all.each do |investor_market|
        printf('.')

        @investor_market = investor_market

        @old_market = Entities::Market.find(investor_market.market_id)
        @old_investor = Entities::Investor.find(investor_market.investor_id)

        @company = (::Company.find_by(permalink: @old_investor.slug.strip.presence) || next)

        @market = ::Market.find_by!(name: @old_market.name)

        @company_market = ::CompanyMarket.new(company: @company, market: @market)

        @company_market.save!
      end

      warn "\nImported investor_market - final statistics"
      warn(
        "before count: #{@company_market_count_before} " \
        "count: #{::CompanyMarket.count} investor_markets"
      )
    rescue => e
      require 'pry'; binding.pry

      raise
    end
  end
end

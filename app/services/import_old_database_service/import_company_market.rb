# frozen_string_literal: true

class ImportOldDatabaseService
  class ImportCompanyMarket
    def run
      ImportOldDatabaseService::Entities::CompanyMarket.all.each do |company_market|
        printf('.')

        old_market = ImportOldDatabaseService::Entities::Market.find(
          company_market.market_id
        )
        old_company = ImportOldDatabaseService::Entities::Company.find(
          company_market.company_id
        )

        new_market = ::Market.find_by!(name: old_market.name)
        new_company = ::Company.find_by!(name: old_company.name)

        ::CompanyMarket.create!(market: new_market, company: new_company)
      end

      warn "\nImported companies_markets - final statistics"

      warn(
        "old_count: #{::ImportOldDatabaseService::Entities::CompanyMarket.count} " \
        "new_count: #{::CompanyMarket.count} companies_markets"
      )
    end
  end
end

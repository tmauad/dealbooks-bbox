# frozen_string_literal: true

class ImportOldDatabaseService
  class ImportMarket
    def run
      ImportOldDatabaseService::Entities::Market.find_each do |market|
        printf('.')

        ::Market.create!(name: market.name)
      end

      warn "\nImported market - final statistics"
      warn "count: #{::Market.count} markets"
    end
  end
end

# frozen_string_literal: true

class ImportOldDatabaseService
  class ImportLocation
    def run
      ImportOldDatabaseService::Entities::Location.find_each do |location|
        printf('.')

        ::Location.create!(country: location.country, city: location.city)
      end

      warn "\nImported location - final statistics"
      warn "count: #{::Location.count} locations"
    end
  end
end

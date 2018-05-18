# frozen_string_literal: true

class ImportOldDatabaseService
  class ImportInvestorLocation
    def run
      @localizable_count_before = ::Localizable.count

      ImportOldDatabaseService::Entities::InvestorLocation
        .all.each do |investor_location|

        printf('.')

        @investor_location = investor_location

        @old_location = Entities::Location.find(investor_location.location_id)
        @old_investor = Entities::Investor.find(investor_location.investor_id)

        @investable = (
          ::Person.find_by(permalink: @old_investor.slug.strip.presence) ||
          ::Company.find_by(permalink: @old_investor.slug.strip.presence)
        )

        @location = ::Location.find_by!(
          city: @old_location.city, country: @old_location.country
        )

        @localizable = ::Localizable.new(
          localizable: @investable,
          location: @location
        )

        @localizable.save!
      end

      warn "\nImported investor_location - final statistics"
      warn(
        "before count: #{@localizable_count_before} " \
        "count: #{::Localizable.count} investor_locations"
      )
    rescue => e
      require 'pry'; binding.pry

      raise
    end
  end
end

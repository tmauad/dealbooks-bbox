# frozen_string_literal: true

class ImportOldDatabaseService
  class ImportCompany
    def run
      ImportOldDatabaseService::Entities::Company.find_each do |company|
        printf('.')

        @company = company

        ::Company.create!(
          name: company.name.presence,
          permalink: company.slug.presence,
          description: company.description.presence,
          # employees_count - is not present in the old version
          # born_date - is not present in the old version
          # phone_number - is not present in the old version
          # email - is not present in the old version
          # facebook_url - is not present in the old version
          # twitter_url - is not present in the old version
          # google_plus_url - is not present in the old version
          website_url: normalize(company.website),
          linkedin_url: normalize(company.linkedin),
          status: company.status.presence || ::Company::ACTIVE
        )
      end

      warn "\nImported company - final statistics"
      warn "count: #{::Company.count} companies"
    rescue => e
      require 'pry'; binding.pry

      'oi'
    end

    private

    def normalize(url)
      ActiveSupport::Inflector.transliterate(
        String(
          url.presence.try(:downcase).try(:strip)
        )
      ).presence
    end
  end
end

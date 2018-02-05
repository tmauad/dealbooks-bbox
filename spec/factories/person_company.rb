# frozen_string_literal: true

FactoryBot.define do
  factory :person_company do
    # Relations
    person
    company

    job_title 'Founder'

    # Optionals
    started_at 10.years.ago.to_date
    ended_at 2.years.ago.to_date
  end
end

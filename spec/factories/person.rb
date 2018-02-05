# frozen_string_literal: true

FactoryBot.define do
  factory :person do
    name 'Steve Jobs'
    permalink 'steve-jobs'
    description 'Awesome entrepreneuer'

    # Optionals
    born_date 60.years.ago.to_date
    gender Person::MALE
    phone_number '55 11 99999-0077'
    occupation 'CEO'
    email 'steve.jobs@apple.com'
    website_url 'http://www.apple.com'
    facebook_url 'https://www.facebook.com/apple'
    twitter_url 'https://twitter.com/apple'
    google_plus_url 'https://googleplus.com/apple'
    linkedin_url 'https://linkedin.com/stevejobs'
  end
end

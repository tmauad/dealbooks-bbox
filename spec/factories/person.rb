# frozen_string_literal: true

FactoryBot.define do
  factory :person do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    permalink { [first_name + last_name].join(' ').parameterize }
    description { Faker::Lorem.paragraph }

    # Optionals
    born_date { Faker::Date.backward }
    gender Person::MALE
    phone_number '55 11 99999-0077'
    occupation { Faker::Name.title }
    email { Faker::Internet.email }
    website_url 'http://www.apple.com'
    facebook_url 'https://www.facebook.com/apple'
    twitter_url 'https://twitter.com/apple'
    google_plus_url 'https://googleplus.com/apple'
    linkedin_url 'https://linkedin.com/stevejobs'
  end
end

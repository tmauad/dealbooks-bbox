# frozen_string_literal: true

FactoryBot.define do
  factory :company do
    status Company::ACTIVE
    name { Faker::Company.name }
    permalink { name.parameterize }
    description { Faker::Company.catch_phrase }

    # Optionals
    employees_count 100
    born_date Date.parse('01/01/2011')
    phone_number { Faker::PhoneNumber.cell_phone }
    email { Faker::Internet.email }
    website_url { Faker::Internet.url }
    linkedin_url { Faker::Internet.url('linkedin.com') }
    facebook_url { Faker::Internet.url('facebook.com') }
    twitter_url 'https://twitter.com/whatever'
  end
end

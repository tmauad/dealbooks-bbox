# frozen_string_literal: true

FactoryBot.define do
  factory :location do
    country { Faker::Address.country }
    region { Faker::Address.state_abbr }
    city { Faker::Address.city }
  end
end

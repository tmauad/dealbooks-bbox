# frozen_string_literal: true

FactoryBot.define do
  factory :location do
    country { Faker::Address.country }
    city { Faker::Address.city }
  end
end

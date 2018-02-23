# frozen_string_literal: true

FactoryBot.define do
  factory :market do
    name { Faker::Company.type }
  end
end

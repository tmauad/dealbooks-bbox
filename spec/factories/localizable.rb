# frozen_string_literal: true

FactoryBot.define do
  factory :localizable do
    localizable { build(:company) }

    location
  end
end

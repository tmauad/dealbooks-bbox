# frozen_string_literal: true

FactoryBot.define do
  factory :investor_market do
    # Relations
    investor
    market
  end
end

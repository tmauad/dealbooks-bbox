# frozen_string_literal: true

FactoryBot.define do
  factory :company_market do
    # Relations
    company
    market
  end
end

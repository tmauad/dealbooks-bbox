# frozen_string_literal: true

FactoryBot.define do
  factory :deal_investor do
    # Relations
    deal
    investor
  end
end

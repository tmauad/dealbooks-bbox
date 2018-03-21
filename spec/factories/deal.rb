# frozen_string_literal: true

FactoryBot.define do
  factory :deal do
    close_date { Faker::Date.backward }
    status Deal::UNVERIFIED
    category Deal::CATEGORIES.sample # eg.: Deal::RAISED_FUNDS_FROM
    round Deal::ROUNDS.sample # eg.: Deal::IPO
    amount_currency Deal::CURRENCIES.sample # eg.: Deal::USD
    amount_cents { Faker::Number.between(1, 10_000_000_00) }
    pre_valuation_currency Deal::CURRENCIES.sample # eg.: Deal::USD
    pre_valuation_cents { Faker::Number.between(1, 10_000_000_00) }
    source_url { Faker::Internet.url }

    company
  end
end

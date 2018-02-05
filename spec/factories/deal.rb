# frozen_string_literal: true

FactoryBot.define do
  factory :deal do
    close_date { Time.zone.today }
    status Deal::UNVERIFIED
    category Deal::RAISED_FUNDS_FROM
    round Deal::IPO
    amount_currency Deal::USD
    amount_cents 100_000_00
    pre_valuation_currency Deal::USD
    pre_valuation_cents 1_000_000_00
    source_url 'https://fakenews.com'

    company
  end
end

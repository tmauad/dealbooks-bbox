# frozen_string_literal: true

FactoryBot.define do
  factory :investor do
    investable { create(:person) }

    status Investor::ACTIVE
    category Investor::ANGEL
    stage Investor::SEED
  end
end

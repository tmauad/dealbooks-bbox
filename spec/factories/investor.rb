# frozen_string_literal: true

FactoryBot.define do
  factory :investor do
    investable { create(:person) }

    status Investor::ACTIVE
    category Investor::ANGEL
    stage Investor::SEED

    trait :company do
      investable { create(:company) }
    end

    trait :person do
      investable { create(:person) }
    end
  end
end

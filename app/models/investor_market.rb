# frozen_string_literal: true

class InvestorMarket < ApplicationRecord
  validates :investor_id, :market_id, presence: true

  belongs_to :investor
  belongs_to :market
end

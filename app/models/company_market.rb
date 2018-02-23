# frozen_string_literal: true

class CompanyMarket < ApplicationRecord
  validates :company_id, :market_id, presence: true

  belongs_to :company
  belongs_to :market
end

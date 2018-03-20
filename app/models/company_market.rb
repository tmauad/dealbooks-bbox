# frozen_string_literal: true

class CompanyMarket < ApplicationRecord
  validates :company, :market, presence: true

  belongs_to :company
  belongs_to :market
end

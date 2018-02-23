# frozen_string_literal: true

class DealInvestor < ApplicationRecord
  validates :deal, :investor, presence: true

  belongs_to :deal
  belongs_to :investor
end

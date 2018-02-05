# frozen_string_literal: true

class DealInvestor < ApplicationRecord
  validates :deal_id, :investor_id, presence: true

  belongs_to :deal
  belongs_to :investor
end

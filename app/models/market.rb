# frozen_string_literal: true

class Market < ApplicationRecord
  validates :name, presence: true

  has_many :investor_markets, dependent: :destroy
end

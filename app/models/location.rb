# frozen_string_literal: true

class Location < ApplicationRecord
  # Validations
  validates :country, :region, :city, presence: true
end

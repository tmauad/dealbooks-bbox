# frozen_string_literal: true

class Location < ApplicationRecord
  validates :country, :city, presence: true

  has_many :localizables, dependent: :destroy
end

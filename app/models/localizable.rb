# frozen_string_literal: true

class Localizable < ApplicationRecord
  validates :localizable_id, :localizable_type, :location_id, presence: true

  belongs_to :localizables, polymorphic: true, inverse_of: :companies
  belongs_to :localizable, polymorphic: true, inverse_of: :localizables
  belongs_to :location
end

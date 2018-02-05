# frozen_string_literal: true

class Localizable < ApplicationRecord
  validates :localizable_id, :localizable_type, :location_id, presence: true

  belongs_to :localizable, polymorphic: true
  belongs_to :location
end

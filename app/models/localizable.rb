# frozen_string_literal: true

class Localizable < ApplicationRecord
  validates :localizable, :localizable_type, :location, presence: true

  # This association is here because of a bug founded in polymorphic
  # association when trying to save nested_attributes in a rails form
  belongs_to(
    :localizables, polymorphic: true, inverse_of: :companies, required: false
  )

  belongs_to :localizable, polymorphic: true, inverse_of: :localizables

  belongs_to :location
end

# frozen_string_literal: true

class Company < ApplicationRecord
  STATUSES = [
    ACTIVE = 'active',
    INACTIVE = 'inactive',
    ACQUIRED = 'acquired',
    MERGED = 'merged'
  ].freeze

  # Validations
  validates :name, :permalink, :description, :status, presence: true

  validates :permalink, slug: true
  validates :status, inclusion: { in: STATUSES }

  validates :employees_count, numericality: { only_integer: true }
  validates :born_date, date: true, allow_nil: true

  validates :email, email: true, allow_nil: true
  validates :website_url, url: true, allow_nil: true
  validates :linkedin_url, url: true, allow_nil: true
  validates :facebook_url, url: true, allow_nil: true
  validates :twitter_url, twitter: { format: :url }, allow_nil: true

  # Relations
  has_many :deals, dependent: :destroy
  has_many :person_companies, dependent: :destroy
  has_many(
    :locations, as: :localizable, dependent: :destroy, inverse_of: :locations
  )
  has_many(
    :investors, as: :investable, dependent: :destroy, inverse_of: :investors
  )
end

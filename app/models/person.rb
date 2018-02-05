# frozen_string_literal: true

class Person < ApplicationRecord
  GENDERS = [MALE = 'male', FEMALE = 'female'].freeze

  # Validations
  validates :name, :permalink, :description, presence: true
  validates :permalink, slug: true, allow_nil: true
  validates :born_date, date: { before: proc { Time.zone.today } }
  validates :gender, inclusion: { in: GENDERS }
  validates :email, email: true, allow_nil: true

  validates :website_url, url: true, allow_nil: true
  validates :facebook_url, url: true, allow_nil: true
  validates :twitter_url, twitter: { format: :url }, allow_nil: true
  validates :google_plus_url, url: true, allow_nil: true
  validates :linkedin_url, url: true, allow_nil: true

  # Relations
  has_many :person_companies, dependent: :destroy
  has_many(
    :locations, as: :localizable, dependent: :destroy, inverse_of: :locations
  )
  has_many(
    :investors, as: :investable, dependent: :destroy, inverse_of: :investors
  )
end

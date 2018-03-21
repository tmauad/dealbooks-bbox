# frozen_string_literal: true

class Person < ApplicationRecord
  GENDERS = [MALE = 'male', FEMALE = 'female'].freeze

  # Validations
  validates :first_name, :last_name, :permalink, :description, presence: true
  validates :permalink, slug: true, allow_nil: true
  validates :permalink, uniqueness: true
  validates :born_date, date: { before: proc { Time.zone.today } }
  validates :gender, inclusion: { in: GENDERS }
  validates :email, email: true, allow_nil: true
  validates :email, uniqueness: true

  validates :website_url, url: true, allow_nil: true
  validates :facebook_url, url: true, allow_nil: true
  validates :twitter_url, twitter: { format: :url }, allow_nil: true
  validates :google_plus_url, url: true, allow_nil: true
  validates :linkedin_url, url: true, allow_nil: true

  # Relations
  has_many :person_companies, dependent: :destroy
  has_many(
    :localizables,
    as: :localizable, dependent: :destroy, inverse_of: :localizables
  )
  has_many :locations, through: :localizables
  has_one :investor, as: :investable, dependent: :destroy

  # Nested
  accepts_nested_attributes_for :person_companies
  accepts_nested_attributes_for :locations

  # Hooks
  before_validation do
    self.permalink = name.parameterize if name.presence
  end

  def name
    [first_name, last_name].join(' ')
  end
end

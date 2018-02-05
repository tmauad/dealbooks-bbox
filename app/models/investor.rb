# frozen_string_literal: true

class Investor < ApplicationRecord
  STATUSES = [
    ACTIVE = 'active',
    INACTIVE = 'inactive',
    ACQUIRED = 'acquired',
    MERGED = 'merged'
  ].freeze

  CATEGORIES = [
    ANGEL = 'angel',
    VENTURE_CAPITAL = 'venture_capital',
    ACCELERATOR = 'accelerator',
    INCUBARTOR = 'incubator',
    CORPORATE = 'corporate'
  ].freeze

  STAGES = [
    SEED = 'seed',
    SERIES_SEED = 'series-seed',
    SERIES_A = 'series-a',
    SERIES_B = 'series-b',
    SERIES_C = 'series-c',
    IPO = 'ipo'
  ].freeze

  # Validations
  validates :investable_id, :investable_type, presence: true

  validates :status, inclusion: { in: STATUSES }
  validates :category, inclusion: { in: CATEGORIES }
  validates :stage, inclusion: { in: STAGES }

  # Relations
  belongs_to :investable, polymorphic: true
  has_many :investor_markets, dependent: :destroy
  has_many :deal_investors, dependent: :destroy

  delegate(
    :name, :description, :permalink,
    :website_url, :linkedin_url, :facebook_url, :twitter_url, :google_plus_url,
    to: :investable
  )
end

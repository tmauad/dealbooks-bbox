# frozen_string_literal: true

class Deal < ApplicationRecord
  CATEGORIES = [
    RAISED_FUNDS_FROM = 'raised-funds-from',
    INCUBATED_BY = 'incubated-by',
    MERGED_WITH = 'merged-with',
    WAS_ACQUIRED_BY = 'was-acquired-by',
    SHUTDOWN = 'shutdown'
  ].freeze

  ROUNDS = [
    ACCELERATION = 'acceleration',
    SEED = 'seed',
    SERIES_SEED = 'series-seed',
    SERIES_A = 'series-a',
    SERIES_B = 'series-b',
    SERIES_C = 'series-c',
    SERIES_D = 'series-d',
    SERIES_E = 'series-e',
    IPO = 'ipo'
  ].freeze

  CURRENCIES = [USD = 'USD', BRL = 'BRL'].freeze

  STATUSES = [UNVERIFIED = 'unverified', VERIFIED = 'verified'].freeze

  # Validations
  validates :close_date, :company_id, :status, :category, presence: true

  validates :close_date, date: true
  validates :close_date, date: { before_or_equal_to: proc { Time.zone.today } }

  validates :category, inclusion: { in: CATEGORIES }
  validates :status, inclusion: { in: STATUSES }
  validates :round, inclusion: { in: ROUNDS }, allow_nil: true
  validates :amount_currency, inclusion: { in: CURRENCIES }, allow_nil: true
  validates(
    :amount_cents,
    numericality: { only_integer: true, greater_than: 0, allow_nil: true }
  )
  validates(
    :pre_valuation_currency, inclusion: { in: CURRENCIES }, allow_nil: true
  )
  validates(
    :pre_valuation_cents,
    numericality: { only_integer: true, greater_than: 0, allow_nil: true }
  )
  validates :source_url, url: true, allow_nil: true

  # Relations
  belongs_to :company
  has_many :deal_investors, dependent: :destroy
  has_many :investors, through: :deal_investors

  # Nested
  accepts_nested_attributes_for :deal_investors

  def amount
    return unless amount_cents

    Float(amount_cents / 100)
  end

  def pre_valuation
    return unless pre_valuation_cents

    Float(pre_valuation_cents / 100)
  end
end

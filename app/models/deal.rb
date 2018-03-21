# frozen_string_literal: true

class Deal < ApplicationRecord
  CATEGORIES = [
    RAISED_FUNDS_FROM = 'raised_funds_from',
    INCUBATED_BY = 'incubated_by',
    MERGED_WITH = 'merged_with',
    WAS_ACQUIRED_BY = 'was_acquired_by',
    SHUTDOWN = 'shutdown'
  ].freeze

  ROUNDS = [
    SEED = 'seed',
    ANGEL = 'angel',
    VENTURE = 'venture',
    EQUITY_CROWDFUNDING = 'equity_crowdfunding',
    PRODUCT_CROWDFUNDING = 'product_crowdfunding',
    PRIVATE_EQUITY = 'private_equity',
    CONVERTIBLE_NOTE = 'convertible_note',
    DEBT_FINANCING = 'debt_financing',
    SECONDARY_MARKET = 'secondary_market',
    GRANT = 'grant',
    POST_IPO_EQUITY = 'post_ipo_equity',
    POST_IPO_DEBT = 'post_ipo_debt',
    NON_EQUITY_ASSISTANCE = 'non_equity_assistance',
    UNDISCLOSED = 'undisclosed',
    UNKNOWN = 'unknown'
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

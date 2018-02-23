# frozen_string_literal: true

class PersonCompany < ApplicationRecord
  # Validations
  validates :person, :company, :job_title, presence: true

  validates :started_at, date: true, allow_nil: true
  validates :ended_at, date: true, allow_nil: true

  # Relations
  belongs_to :person
  belongs_to :company

  def current?
    started_at && !ended_at
  end
end

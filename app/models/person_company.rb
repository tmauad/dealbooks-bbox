# frozen_string_literal: true

class PersonCompany < ApplicationRecord
  # Validations
  validates :person_id, :company_id, :job_title, presence: true

  validates :started_at, date: true, allow_nil: true
  validates :ended_at, date: true, allow_nil: true

  # Relations
  belongs_to :person
  belongs_to :company
end

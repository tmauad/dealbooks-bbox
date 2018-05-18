# frozen_string_literal: true

class ImportOldDatabaseService
  module Entities
    class Deal < ActiveRecord::Base
      self.table_name = 'deals'

      establish_connection ImportOldDatabaseService::CONNECTION_CONFIG

      # Columns
      #
      # id, close_date, category, round, currency, amount,
      # pre_valuation, source_url, company_id, created_at, updated_at,
      # verified
    end
  end
end

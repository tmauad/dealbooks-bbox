# frozen_string_literal: true

class ImportOldDatabaseService
  module Entities
    class InvestorMarket < ActiveRecord::Base
      self.table_name = 'investors_markets'

      establish_connection ImportOldDatabaseService::CONNECTION_CONFIG
    end
  end
end

# frozen_string_literal: true

class ImportOldDatabaseService
  module Entities
    class CompanyMarket < ActiveRecord::Base
      self.table_name = 'companies_markets'

      establish_connection ImportOldDatabaseService::CONNECTION_CONFIG
    end
  end
end

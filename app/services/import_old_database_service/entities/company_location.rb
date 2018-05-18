# frozen_string_literal: true

class ImportOldDatabaseService
  module Entities
    class CompanyLocation < ActiveRecord::Base
      self.table_name = 'companies_locations'

      establish_connection ImportOldDatabaseService::CONNECTION_CONFIG
    end
  end
end

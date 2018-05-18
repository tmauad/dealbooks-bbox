# frozen_string_literal: true

class ImportOldDatabaseService
  module Entities
    class InvestorLocation < ActiveRecord::Base
      self.table_name = 'investors_locations'

      establish_connection ImportOldDatabaseService::CONNECTION_CONFIG

      # investor_id && location_id
    end
  end
end

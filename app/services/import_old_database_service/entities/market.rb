# frozen_string_literal: true

class ImportOldDatabaseService
  module Entities
    class Market < ActiveRecord::Base
      self.table_name = 'markets'

      establish_connection ImportOldDatabaseService::CONNECTION_CONFIG
    end
  end
end

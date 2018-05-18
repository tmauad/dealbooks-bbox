# frozen_string_literal: true

class ImportOldDatabaseService
  module Entities
    class Location < ActiveRecord::Base
      self.table_name = 'locations'

      establish_connection ImportOldDatabaseService::CONNECTION_CONFIG

      # id, country, region, city, created_at, updated_at
    end
  end
end

# frozen_string_literal: true

class ImportOldDatabaseService
  module Entities
    class Investor < ActiveRecord::Base
      self.table_name = 'investors'

      establish_connection ImportOldDatabaseService::CONNECTION_CONFIG

      # id name description
      # website
      # linkedin
      # status
      # category
      # stage
      # created_at
      # updated_at
      # slug
    end
  end
end

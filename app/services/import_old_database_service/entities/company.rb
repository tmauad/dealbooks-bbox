# frozen_string_literal: true

class ImportOldDatabaseService
  module Entities
    class Company < ActiveRecord::Base
      self.table_name = 'companies'

      establish_connection ImportOldDatabaseService::CONNECTION_CONFIG

      # Columns
      #
      # id, name, description, website, linkedin, status, created_at,
      # updated_at, slug
    end
  end
end

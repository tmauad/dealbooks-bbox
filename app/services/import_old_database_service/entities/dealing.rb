# frozen_string_literal: true

class ImportOldDatabaseService
  module Entities
    class Dealing < ActiveRecord::Base
      self.table_name = 'dealings'

      establish_connection ImportOldDatabaseService::CONNECTION_CONFIG

      # {"id"=>1, "deal_id"=>1, "buyer_id"=>1, "buyer_type"=>"Investor",
    end
  end
end

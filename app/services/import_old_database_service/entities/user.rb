# frozen_string_literal: true

class ImportOldDatabaseService
  module Entities
    class User < ActiveRecord::Base
      self.table_name = 'users'

      establish_connection ImportOldDatabaseService::CONNECTION_CONFIG

      # id
      # email
      # encrypted_password
      # reset_password_token
      # reset_password_sent_at
      # remember_created_at
      # sign_in_count
      # current_sign_in_at
      # last_sign_in_at
      # current_sign_in_ip
      # last_sign_in_ip
      # full_name
      # created_at
      # updated_at
      # role
      # provider
      # uid
    end
  end
end

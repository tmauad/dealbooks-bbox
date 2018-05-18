# frozen_string_literal: true

class ImportOldDatabaseService
  CONNECTION_CONFIG = {
    adapter: 'postgresql',
    encoding: 'utf8',
    host: ENV.fetch('DEALBOOK_IMPORT_DB_HOST'),
    database: ENV.fetch('DEALBOOK_IMPORT_DB_DATABASE'),
    pool: 5,
    username: ENV.fetch('DEALBOOK_IMPORT_DB_USERNAME'),
    password: ENV.fetch('DEALBOOK_IMPORT_DB_PASSWORD')
  }.freeze

  def self.run
    new.send(:run)
  end

  private

  def run
    handle_errors do
      ImportOldDatabaseService::ImportMarket.new.run

      ImportOldDatabaseService::ImportCompany.new.run

      ImportOldDatabaseService::ImportDeal.new.run

      ImportOldDatabaseService::ImportCompanyMarket.new.run

      ImportOldDatabaseService::ImportLocation.new.run

      ImportOldDatabaseService::ImportCompanyLocation.new.run

      ImportOldDatabaseService::ImportInvestor.new.run

      ImportOldDatabaseService::ImportInvestorLocation.new.run

      ImportOldDatabaseService::ImportInvestorMarket.new.run

      ImportOldDatabaseService::ImportDealing.new.run

      ImportOldDatabaseService::ImportUser.new.run
    end
  end

  def handle_errors
    ActiveRecord::Base.transaction do
      yield
    rescue => e
      puts e.message

      raise
    end
  end
end

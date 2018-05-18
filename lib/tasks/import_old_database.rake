# frozen_string_literal: true

namespace :import_old_database do
  task import: [:environment] do
    puts '-- Start importing'

    ImportOldDatabaseService.run

    puts '-- Finished importing'
  end
end

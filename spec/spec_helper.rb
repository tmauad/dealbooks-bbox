ENV['RAILS_ENV'] ||= 'test'

require File.expand_path('../../config/environment', __FILE__)

if Rails.env.production?
  abort(
    'The Rails environment is running in production mode!'
  )
end

require 'rspec/rails'

ActiveRecord::Migration.maintain_test_schema!

require 'shoulda/matchers'.freeze

RSpec.configure do |config|
  config.include(Shoulda::Matchers::ActiveModel)
  config.include(Shoulda::Matchers::ActiveRecord)
  config.include(Devise::Test::ControllerHelpers, type: :controller)
  config.include(Devise::Test::ControllerHelpers, type: :view)

  config.include(FactoryBot::Syntax::Methods)

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups

  config.order = :random

  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  config.use_transactional_fixtures = true

  config.infer_spec_type_from_file_location!

  config.filter_rails_from_backtrace!
end

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec

    with.library :active_record
  end
end

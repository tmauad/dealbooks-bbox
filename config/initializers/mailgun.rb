# frozen_string_literal: true

Mailgun.configure do |config|
  config.api_key = ENV.fetch('DEALBOOK_MAILGUN_API_KEY')
end

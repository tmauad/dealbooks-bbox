# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: "dont_reply@#{ENV.fetch('DEALBOOK_DOMAIN')}"

  layout 'mailer'
end

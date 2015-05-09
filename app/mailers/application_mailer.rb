class ApplicationMailer < ActionMailer::Base
  # Default sender
  default from: 'from@example.com'

  # Layout
  layout 'mailer'
end

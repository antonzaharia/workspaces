class ApplicationMailer < ActionMailer::Base
  include Devise::Controllers::UrlHelpers
  include Rails.application.routes.url_helpers
  
  default from: 'noreply@gooff.com'
  layout 'mailer'
end

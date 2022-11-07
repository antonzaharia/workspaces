class ApplicationMailer < ActionMailer::Base
  include Devise::Controllers::UrlHelpers
  default from: 'noreply@gooff.com'
  layout 'mailer'

  def root_url
    Rails.application.secrets.root_url
  end
end

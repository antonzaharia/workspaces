class UserMailer < ApplicationMailer
  default template_path: 'users/mailer'

  def welcome_email
    @user = params[:user]
    @url = root_url
    mail(to: @user.email, subject: 'Welcome to OffDays')
  end
end
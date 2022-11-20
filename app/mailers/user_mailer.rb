class UserMailer < ApplicationMailer
  def welcome_email
    @user = params[:user]
    @url = root_url
    mail(to: @user.email, subject: 'Welcome to Gooff')
  end

  def invitation_email
    @workspace_user = params[:workspace_user]
    @url = root_url
    mail(to: @workspace_user.email, subject: "You've been invited to GOOFF!")
  end
end

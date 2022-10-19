module ApplicationHelper
  def resource_name
    :user
  end

  def resource
    @user ||= User.new
  end
  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  def bootstrap_devise_error_messages!
    return '' if resource.errors.empty?

    messages = resource.errors.full_messages.each { |msg| flash[:alert] = msg }
  end
end

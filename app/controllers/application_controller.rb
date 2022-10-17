class ApplicationController < ActionController::Base
  def redirect_to_auth
    unless current_user
      redirect_to root_path
    end
  end
end

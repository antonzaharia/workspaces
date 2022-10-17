class HomeController < ApplicationController
  before_action :redirect_to_dashboard, only: [:index]
  before_action :redirect_to_auth, only: [:dashboard]
  def index; end
  def dashboard; end

  private

  def redirect_to_dashboard
    if current_user
      redirect_to dashboard_path
    end
  end
end

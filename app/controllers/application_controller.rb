class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception, prepend: true

  before_action :ensure_subdomain

  helper_method :current_workspace

  def redirect_to_auth
    redirect_to root_path unless current_user
  end

  def current_workspace
    @current_workspace ||= Workspace.find_by(slug: request.subdomain)
  end

  def root_domain?
    request.subdomain.blank?
  end

  private

  def ensure_subdomain
    redirect_to root_url(subdomain: nil), allow_other_host: true if request.subdomain.present? && current_workspace.blank?
  end
end

class Admin::BaseController < ApplicationController
  layout 'admin'
  before_action :require_login

  private

  def require_login
    unless session[:admin_user_id]
      redirect_to admin_login_path, alert: "Please log in first."
    end
  end

  def current_user
    @current_user ||= session[:admin_user_id]
  end
  helper_method :current_user
end

# Application Controller
class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !current_user.nil?
  end

  def admin?
    redirect_to root_url unless current_user.admin_role
  end

  def authorize
    redirect_to login_url, alert: 'Необходимо авторизоваться' if current_user.nil?
  end
end

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :ensure_login
  helper_method :is_logged_in?, :current_user

  protected

  def ensure_login
  	redirect_to login_path, notice: 'Necesitas iniciar sesión.' unless session[:user_id]
  end

  def is_logged_in?
  	session[:user_id]
  end

  def current_user
  	User.find(session[:user_id]) unless @current_user
  end
end

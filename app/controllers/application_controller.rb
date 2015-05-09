class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # Helper methods
  helper_method :current_user, :current_session
  helper :all

  # Custom flash
  add_flash_types :info, :warning

  private

  # Current session
  def current_session
    @current_session ||= UserSession.find
  end

  # Current user
  def current_user
    @current_user ||= current_session && current_session.record
  end

  def require_login
    unless current_user
      store_location
      redirect_to login_path, info: 'You need to logged in to access this page'
    end
  end

  def require_logout
    if current_user
      store_location
      redirect_to root_path, info: 'You need to logged out to access this page'
    end
  end

  def store_location
    session[:return_to] = request.url
  end

  # Friendly redirect
  def redirect_back_or_default(default)
    redirect_to(session[:return_to] || default)
    session[:return_to] = nil
  end

end

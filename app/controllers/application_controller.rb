class ApplicationController < ActionController::Base

  helper_method :current_user, :sessions_user_id, :authenticated?, :authorized?

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def check_authentication
    redirect_to new_session_path unless authenticated?
  end

  def current_user
    @current_user ||= User.find_by(id: sessions_user_id)
  end

  def sessions_user_id
    @sessions_user_id ||= session[:user_id]
  end

  def authenticated?
    sessions_user_id != nil
  end

  def authorized? id
    sessions_user_id == id.to_i
  end
end

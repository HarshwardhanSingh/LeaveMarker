# Base controller class
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def authenticate_user!
    redirect_to new_session_path, flash: {
      error: I18n.t('authenticate_user.failure')
    } if session[:user_id].blank?
  end
end

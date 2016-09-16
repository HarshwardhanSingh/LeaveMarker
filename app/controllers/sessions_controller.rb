# Handles user session (Google OAuth)
class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.from_omniauth(env['omniauth.auth'])
    session[:user_id] = user.id
    redirect_to calendars_path, flash:
      {
        notice:
        I18n.t(
          'session.create.success',
          username: current_user.name.capitalize
        )
      }
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, flash: { notice: I18n.t('session.destroy.success') }
  end
end

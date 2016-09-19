class User < ApplicationRecord
  has_many :calendars
  
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |user|
      user.name = auth.info.name
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.email = auth.info.email
      user.avatar = auth.info.image
      if user.save!
        return user
      else
        redirect_to login_path
      end
    end
  end
end

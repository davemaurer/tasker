class User < ActiveRecord::Base
  has_many :lists

  def self.from_omniauth(auth_info)
    user = where(uid: auth_info.uid).first_or_create
    user.update_attributes(name:               auth_info.extra.raw_info.name,
                           oauth_token:        auth_info.credentials.token,
                           oauth_token_secret: auth_info.credentials.secret
                          )
    user
  end
end

class Authentication < ActiveRecord::Base
  belongs_to :user

  def self.find_or_create_with_omniauth(auth)
    user = Authentication.find_or_create_by(uid: auth['uid'], provider: auth['provider'])
    user.update(name: auth[:info][:name], token: auth.credentials.token, secret: auth.credentials.secret)
  end

  # def self.create_with_omniauth(auth)
    # create(uid: auth['uid'], provider: auth['provider'])
  # end
end

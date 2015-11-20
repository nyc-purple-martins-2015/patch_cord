class User < ActiveRecord::Base
  has_secure_password

  validates :username, presence: true, uniqueness: true
  validates :password_digest, :phone, presence: true

  has_many :user_genres
  has_many :user_instruments
  has_many :user_bands
  has_many :instruments, through: :user_instruments
  has_many :genres, through: :user_genres
  has_many :bands, through: :user_bands
  has_many :media_resources, as: :showable

  def self.sign_in_from_omniauth(auth)
    find_by(provider: auth['provider'], uid: auth["uid"]) || create_user_from_omniauth(auth)
  end

  def self.create_user_from_omniauth(auth)
    create(
      provider: auth['provider'],
      uid: auth['uid'],
      username: auth['info']['name']
    )
  end
end

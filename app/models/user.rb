class User < ActiveRecord::Base
  has_secure_password

  validates :username, presence: true, uniqueness: true

  has_many :user_genres
  has_many :user_instruments
  has_many :user_bands
  has_many :instruments, through: :user_instruments
  has_many :genres, through: :user_genres
  has_many :bands, through: :user_bands
  has_many :media_resources, as: :showable

  has_many :authentications

  def self.create_with_omniauth(auth)
    create(username: auth[:info][:name])
  end
end

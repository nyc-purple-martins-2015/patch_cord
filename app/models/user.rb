class User < ActiveRecord::Base
  has_secure_password

  validates :username, presence: true

  has_many :user_genres
  has_many :user_instruments
  has_many :user_bands
  has_many :instruments, through: :user_instruments
  has_many :genres, through: :user_genres
  has_many :bands, through: :user_bands
  has_many :media_resources, as: :showable

  def self.validate_via_provider(auth)
    @user = User.find_or_create_by(provider: auth[:provider], uid: auth[:uid])
    @user.username = auth[:info][:name]
    if @user.new_record?
      @user.password = SecureRandom.uuid()
      @user.phone = '122345689'
      @user.save!
    end
  end

end

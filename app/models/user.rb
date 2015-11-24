class User < ActiveRecord::Base
  has_secure_password
  acts_as_mappable :lat_column_name => :latitude,
                   :lng_column_name => :longitude

  before_save :has_lat_long

  validates :username, presence: true

  has_many :user_genres
  has_many :user_instruments
  has_many :user_bands
  has_many :instruments, through: :user_instruments
  has_many :genres, through: :user_genres
  has_many :bands, through: :user_bands
  has_many :media_resources, as: :showable

  def self.validate_via_provider(auth)
    @user = User.find_by(provider: auth[:provider], uid: auth[:uid])
    @user = User.new(provider: auth[:provider], uid: auth[:uid]) unless @user
    @user.username = auth[:info][:name]
    if @user.new_record?
      @user.password = SecureRandom.uuid()
      @user.phone = '122345689'
      @user.save
    end
      @user
  end

  def has_instruments?
    self.instruments.any?
  end

  def has_media_resources?
    self.media_resources.any?
  end

  def parse_address
    address1 = self.address_line1
    city = self.city
    state = self.state
    zip = self.zip
    address = "#{address1} #{city} #{state} #{zip}"
  end

  def lat_long
    # OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE
    if self.latitude == nil && self.longitude == nil
      addr = URI.escape(parse_address)
      res = HTTParty.get("https://maps.googleapis.com/maps/api/geocode/json?address=#{addr}&key=AIzaSyC7dmZEFn1tJOy7zeVH2Hce3tF8U0_MnIg")
      lat =  res["results"][0]["geometry"]["location"]["lat"]
      lng =  res["results"][0]["geometry"]["location"]["lng"]
      self.update(latitude: lat, longitude: lng)
    end
  end

  def has_lat_long
    if self.address_line1 && self.latitude == nil && self.longitude == nil
      lat_long
    elsif self.address_line1 == nil
    end
  end

end

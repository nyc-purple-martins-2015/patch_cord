class Band < ActiveRecord::Base
  acts_as_mappable :lat_column_name => :latitude,
                   :lng_column_name => :longitude

  before_save :set_lat_long

  has_many :media_resources, as: :showable
  has_many :user_bands
  has_many :users, through: :user_bands
  belongs_to :admin, class_name: "User"
  has_many :band_genres
  has_many :genres, through: :band_genres

  validates :name, :admin_id, presence: true

  def has_media_resources?
    self.media_resources.any?
  end

  def set_lat_long
    admin = User.find(self.admin_id)
    self.latitude = admin.latitude
    self.longitude = admin.longitude
  end

  def map_string
    admin = User.find(self.admin_id)
    "&markers=color:red%7Clabel:" + "#{admin.username.first}" +"%7C" + "#{admin.latitude.to_f.to_s}," + "#{admin.longitude.to_f.to_s}"
  end

end

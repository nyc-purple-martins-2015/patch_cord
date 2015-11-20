class Band < ActiveRecord::Base
  has_many :media_resources, as: :showable
  has_many :user_bands
  has_many :users, through: :user_bands
  belongs_to :admin, class_name: "User" #Do we need to add a foreign key here?
  has_many :band_genres
  has_many :genres, through: :band_genres
  # has_many :instruments, through: :users
  #TODO Check this association, do we need to create a many-many relationship between bands and instruments?

  validates :name, :admin_id, presence: true
end

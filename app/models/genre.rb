class Genre < ActiveRecord::Base
validates :name, presence: true, uniqueness: true

has_many :band_genres
has_many :bands, through: :band_genres
has_many :user_genres
has_many :users, through: :user_genres
end

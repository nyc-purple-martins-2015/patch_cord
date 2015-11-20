class BandGenre < ActiveRecord::Base
  validates :band_id, :genre_id, presence: true

  belongs_to :band
  belongs_to :genre
end

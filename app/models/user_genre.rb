class UserGenre < ActiveRecord::Base
  validates :user_id, :genre_id, presence: true

  belongs_to :user
  belongs_to :genre
end

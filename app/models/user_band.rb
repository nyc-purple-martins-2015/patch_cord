class UserBand < ActiveRecord::Base
  validates :user_id, :band_id, presence: true

  belongs_to :user
  belongs_to :band
end

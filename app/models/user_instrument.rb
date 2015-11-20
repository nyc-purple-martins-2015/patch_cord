class UserInstrument < ActiveRecord::Base
  validates :user_id, :instrument_id, presence: true

  belongs_to :user
  belongs_to :instrument
end

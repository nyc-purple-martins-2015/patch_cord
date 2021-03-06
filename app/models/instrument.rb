class Instrument < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true

  has_many :user_instruments
  has_many :users, through: :user_instruments
end

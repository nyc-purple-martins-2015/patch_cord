class MediaResource < ActiveRecord::Base
  belongs_to :showable, polymorphic: true
end

class Story < ActiveRecord::Base
  belongs_to :service
  has_many :story_stages
end

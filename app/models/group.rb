class Group < ActiveRecord::Base
  has_many :group_memberships
  has_many :stories, :through => :group_memberships
end

class Group < ActiveRecord::Base
  has_paper_trail ignore: [:updated_at, :created_at, :id]

  has_many :group_memberships
  has_many :stories, :through => :group_memberships
end

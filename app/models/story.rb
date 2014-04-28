class Story < ActiveRecord::Base
  belongs_to :service
  has_many :story_stages

  def nodes
    nodes = []
    story_stages.each do |story_stage|
      nodes << story_stage.from
      nodes << story_stage.to
    end
    nodes.uniq
  end
end

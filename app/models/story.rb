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

  def system_links
    system_links = []
    nodes.each do |node|
      system_links += node.system_links if node.is_a? System
    end
    system_links.collect {|sl| sl if self.nodes.include?(sl.system_a) && self.nodes.include?(sl.system_b)}.compact.uniq
  end
end

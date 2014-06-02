class Story < ActiveRecord::Base
  belongs_to :service
  belongs_to :replaces_story, :class_name => "Story"
  has_many :story_stages, :dependent => :destroy
  has_many :story_link_entrances, :class_name => "StoryLink", :foreign_key => "to_id", :dependent => :destroy
  has_many :story_link_exits, :class_name => "StoryLink", :foreign_key => "from_id", :dependent => :destroy
  has_many :parents, :through => :story_link_entrances, :source => 'from'
  has_many :children, :through => :story_link_exits, :source => 'to'

  scope :no_stages, -> { where("story_stages_count = 0") }

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

  def average_time
    story_stages.collect(&:average_time).compact.inject{|sum,x| sum + x }
  end


  def average_time_string
    ChronicDuration.output(average_time) if average_time
  end
end

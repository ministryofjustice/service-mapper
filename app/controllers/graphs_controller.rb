class GraphsController < ApplicationController  
  def index
    @stories = Story.find(params[:story_ids]) if params[:story_ids]
    respond_to do |format|
      format.html
      format.json do 
        render :json => { :nodes => nodes.collect(&:graph_json), :links => links.collect(&:graph_json) }
      end
    end
  end

  private

  def nodes
    if @stories
      nodes = []
      @stories.each do |story|
        nodes += story.nodes
      end
      nodes.uniq
    else
      System.all + Person.all
    end
  end

  def links
    if @stories
      links = []
      @stories.each do |story|
        links += story.system_links
        links += story.story_stages.all
      end
      links.uniq
    else
      SystemLink.all + StoryStage.all
    end
  end
end

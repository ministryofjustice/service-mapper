class GraphsController < ApplicationController  
  def index
    @story = Story.find(params[:story_id]) if params[:story_id]
    respond_to do |format|
      format.html
      format.json do 
        render :json => { :nodes => nodes.collect(&:graph_json), :links => links.collect(&:graph_json) }
      end
    end
  end

  private

  def nodes
    if params[:story_id]
      Story.find(params[:story_id]).nodes
    else
      System.all + Person.all
    end
  end

  def links
    if params[:story_id]
      Story.find(params[:story_id]).system_links + Story.find(params[:story_id]).story_stages.all
    else
      SystemLink.all + StoryStage.all
    end
  end
end

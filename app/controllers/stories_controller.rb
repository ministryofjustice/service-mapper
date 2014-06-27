class StoriesController < ApplicationController
  before_action :set_story, only: [:show, :edit, :update, :destroy]
  before_action :set_stories, only: [:index, :user_journeys_graph, :systems_graph]

  def index
  end

  def user_journeys_graph
    @story_links = []
    @stories.each do |story|
      @story_links += story.story_link_entrances
    end
  end

  def systems_graph
    @stories = Story.find(params[:story_ids]) if params[:story_ids]
    respond_to do |format|
      format.html
      format.json do 
        render :json => { :nodes => nodes.collect(&:graph_json), :links => links.collect(&:graph_json) }
      end
    end
  end

  def show
  end

  def new
    @story = Story.new
  end

  def edit
  end

  def create
    @story = Story.new(story_params)
    if @story.save
      redirect_to @story, notice: 'Transaction added.'
    else
      render action: 'new'
    end
  end

  def update
    if @story.update(story_params)
      redirect_to @story, notice: 'Story was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @story.destroy
    redirect_to stories_url
  end

  private
  def set_story
    @story = Story.find(params[:id])
  end

  def set_stories
    if params[:story_ids].present?
      @stories = Story.find(params[:story_ids])        
    elsif params[:group_id].present?
      @group = Group.find(params[:group_id])
      @stories = @group.stories.order("created_at ASC").all
    elsif params[:system_id].present?
      @system = System.find(params[:system_id])
      @stories = @system.stories
    else
      @stories = Story.order("created_at ASC").all
    end
  end

  def story_params
    params.require(:story).permit(:name, :status, :owner, :description, :replaces_story_id, parent_ids: [], group_ids: [])
  end

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
        links += story.story_stages.all
      end
      links.uniq
    else
      StoryStage.all
    end
  end

end

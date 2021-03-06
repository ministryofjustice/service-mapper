class StoriesController < ApplicationController
  before_action :set_story, only: [:show, :edit, :update, :destroy]
  before_action :set_stories, only: [:index, :user_journeys_graph, :systems_graph]
  before_action :catch_new_groups, only: [:update, :create]

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
      redirect_to @story, notice: 'Transaction saved.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @story.destroy
    redirect_to stories_url, notice: 'Transaction deleted'
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
      @stories = @group.stories.order("created_at ASC")
    elsif params[:system_id].present?
      @system = System.find(params[:system_id])
      @stories = @system.stories
    else
      @stories = Story.order("created_at ASC")
    end
  end

  def catch_new_groups
    if params[:story].present? && params[:story][:group_ids].present?
      params[:story][:group_ids] = params[:story][:group_ids].collect do |group|
        if group.match(/\D/)
          new_group = Group.create(:name => group)
          new_group.id.to_s
        else
          group
        end
      end
    end
  end

  def story_params
    params.require(:story).permit(:name, :status, :contact_name, :contact_email, :contact_team, :description, :replaces_story_id, parent_ids: [], group_ids: [])
  end

  def nodes
    if @stories
      nodes = []
      @stories.each do |story|
        nodes += story.nodes
      end
      nodes.uniq
    else
      System.all
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

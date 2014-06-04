class StoriesController < ApplicationController
  before_action :set_story, only: [:show, :edit, :update, :destroy]
  before_action :set_stories, only: [:index, :user_journeys_graph, :systems_graph]

  # GET /stories
  # GET /stories.json
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

  # GET /stories/1
  # GET /stories/1.json
  def show
  end

  # GET /stories/new
  def new
    @story = Story.new
  end

  # GET /stories/1/edit
  def edit
  end

  # POST /stories
  # POST /stories.json
  def create
    @story = Story.new(story_params)

    respond_to do |format|
      if @story.save
        format.html { redirect_to @story, notice: 'Story was successfully created.' }
        format.json { render action: 'show', status: :created, location: @story }
      else
        format.html { render action: 'new' }
        format.json { render json: @story.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stories/1
  # PATCH/PUT /stories/1.json
  def update
    respond_to do |format|
      if @story.update(story_params)
        format.html { redirect_to @story, notice: 'Story was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @story.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stories/1
  # DELETE /stories/1.json
  def destroy
    @story.destroy
    respond_to do |format|
      format.html { redirect_to stories_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_story
      @story = Story.find(params[:id])
    end

    def set_stories
      if params[:story_ids].present?
        @stories = Story.find(params[:story_ids])        
      elsif params[:service_id].present?
        @service = Service.find(params[:service_id])
        @stories = @service.stories.order("created_at ASC").all
      elsif params[:system_id].present?
        @system = System.find(params[:system_id])
        @stories = @system.stories
      else
        @stories = Story.order("created_at ASC").all
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def story_params
      params.require(:story).permit(:name, :service_id, :status, :owner, :description, :replaces_story_id, parent_ids: [])
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
        links += story.system_links
        links += story.story_stages.all
      end
      links.uniq
    else
      SystemLink.all + StoryStage.all
    end
  end

end

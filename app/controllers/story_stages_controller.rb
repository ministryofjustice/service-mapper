class StoryStagesController < ApplicationController
  before_action :set_story
  before_action :set_story_stage, only: [:show, :edit, :update, :destroy]
  skip_before_filter :verify_authenticity_token, only: [:sort]

  def index
    @story_stages = @story.story_stages.ordered.all
  end

  def show
    if request.xhr?
      render :layout => false, :template => 'story_stages/info_panel'
    end
  end

  def new
    @story_stage = @story.story_stages.build
  end

  def edit
  end

  def create
    @story_stage = @story.story_stages.build(story_stage_params)
    if @story_stage.save
      redirect_to @story, notice: 'Story stage was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    if @story_stage.update(story_stage_params)
      redirect_to @story, notice: 'Story stage was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @story_stage.destroy
    redirect_to story_story_stages_url(@story)
  end

  def sort
    params[:story_stage].each_with_index do |story_stage_id, i|
      @story.story_stages.find(story_stage_id).update_attribute(:position, i+1)
    end
    render :nothing => true
  end

  private
    def set_story_stage
      @story_stage = @story.story_stages.find(params[:id])
    end

    def set_story
      @story = Story.find(params[:story_id])
    end

    def story_stage_params
      allowed_params = [:payload, :description, :chronic_duration_average_time]
      ["from", "to"].each do |direction|
        if params["#{direction}_selector"] == "existing"
          allowed_params << "#{direction}_id"
        elsif params["#{direction}_selector"] == "new"
          allowed_params << {"#{direction}_attributes" => System.permitted_params}
        end
      end
      params.require(:story_stage).permit(allowed_params)
    end
end

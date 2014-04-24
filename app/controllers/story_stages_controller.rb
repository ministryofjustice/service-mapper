class StoryStagesController < ApplicationController
  before_action :set_story_stage, only: [:show, :edit, :update, :destroy]

  # GET /story_stages
  # GET /story_stages.json
  def index
    @story_stages = StoryStage.all
  end

  # GET /story_stages/1
  # GET /story_stages/1.json
  def show
  end

  # GET /story_stages/new
  def new
    @story_stage = StoryStage.new
  end

  # GET /story_stages/1/edit
  def edit
  end

  # POST /story_stages
  # POST /story_stages.json
  def create
    @story_stage = StoryStage.new(story_stage_params)

    respond_to do |format|
      if @story_stage.save
        format.html { redirect_to @story_stage, notice: 'Story stage was successfully created.' }
        format.json { render action: 'show', status: :created, location: @story_stage }
      else
        format.html { render action: 'new' }
        format.json { render json: @story_stage.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /story_stages/1
  # PATCH/PUT /story_stages/1.json
  def update
    respond_to do |format|
      if @story_stage.update(story_stage_params)
        format.html { redirect_to @story_stage, notice: 'Story stage was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @story_stage.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /story_stages/1
  # DELETE /story_stages/1.json
  def destroy
    @story_stage.destroy
    respond_to do |format|
      format.html { redirect_to story_stages_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_story_stage
      @story_stage = StoryStage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def story_stage_params
      params.require(:story_stage).permit(:story_id, :from_str, :to_str, :payload, :description)
    end
end

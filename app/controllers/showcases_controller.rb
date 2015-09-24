class ShowcasesController < ApplicationController
  before_action :set_showcase, only: [:show, :edit, :update, :destroy]
  before_action :require_login, except: [:index, :show]

  # GET /showcase
  # GET /showcase.json
  def index
    @showcases = Showcase.all
  end

  # GET /showcase/1
  # GET /showcase/1.json
  def show
    @comment = Comment.new
    @comment.parent = @showcase
  end

  # GET /showcase/new
  def new
    @showcase = Showcase.new
  end

  # GET /showcase/1/edit
  def edit
  end

  # POST /showcase
  # POST /showcase.json
  def create
    @showcase = Showcase.new(showcase_params)
    @showcase.user = current_user

    respond_to do |format|
      if @showcase.save
        format.html { redirect_to showcases_path(@showcase), notice: 'Showcase was successfully created.' }
        format.json { render action: 'show', status: :created, location: showcase_path(@showcase) }
      else
        format.html { render action: 'new' }
        format.json { render json: @showcase.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /showcase/1
  # PATCH/PUT /showcase/1.json
  def update
    authorize @showcase
    respond_to do |format|
      if @showcase.update(showcase_params)
        format.html { redirect_to showcases_path(@showcase), notice: 'Showcase was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @showcase.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /showcase/1
  # DELETE /showcase/1.json
  def destroy
    @showcase.destroy
    respond_to do |format|
      format.html { redirect_to showcase
    _url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_showcase
      @showcase = showcase.find(params[:showcase_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def showcase_params
      params.require(:showcase).permit(
        :showcase_id,
        :title,
        :description,
        :user_id,
        :project_website_url,
        :GH_repo_url,
        :app_store_url,
        :google_play_url
    end
end

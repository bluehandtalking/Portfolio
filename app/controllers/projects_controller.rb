class ProjectsController < ApplicationController

  before_action :set_project, only: [:show, :edit, :update, :destroy]
  before_action :auth_project, only: [:update, :destroy, :publish]
  before_filter :authenticate_user!, except: [:index, :show]


  layout "standard"

  def index
    @projects = policy_scope(Project.scoped)   #Project.all  
  end

  def portfolio
  end

  def new
    @project = Project.new
  end

  def show
    @project = Project.find(params[:id])
    @commentable = @project
    @comments = @commentable.comments
    @comment = Comment.new

  end

  def edit
  end

  # Set published flag
  def publish
    set_project
    authorize @project, :update?
    @project.published = true
    @project.save
    redirect_to project_url( @project )
  end


  def create
    @project = Project.new(project_params)
    authorize @project
    @project.comments.build
    respond_to do |format|
      if @project.save
        current_user.projects << @project
        format.html { redirect_to action: 'show', id: @project.id, notice: 'Project was successfully created.' }
        format.json { render action: 'show', status: :created, location: @project }
      else
        format.html { render action: 'new' }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url }
      format.json { head :no_content }
    end
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(:name, :description, :content)
    end

  def auth_project
    set_project
    authorize @project
  end


end

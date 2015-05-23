class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  before_action :require_login

  # GET /projects
  def index
    @projects = Project.all

    respond_to do |format|
      format.html
      format.json { render json: @projects }
    end
  end

  # GET /projects/1
  def show
  end

  # GET /projects/new
  def new
    @project = current_user.projects.new
  end

  # GET /projects/1/edit
  def edit
    authorize @project
  end

  # POST /projects
  def create
    @project = current_user.projects.new(project_params)
    if params[:cancel]
      redirect_to projects_path
    elsif @project.save
      redirect_to @project, info: 'Project was successfully created.'
    else
      render :new
    end

    # For debugging
    # byebug
    # render :new
  end

  # PATCH/PUT /projects/1
  def update
    authorize @project
    if params[:cancel]
      redirect_to @project
    elsif @project.update(project_params)
      redirect_to @project, info: 'Project was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /projects/1
  def destroy
    @project.destroy
    redirect_to projects_url, info: 'Project was successfully destroyed.'
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find_by_slug!(params[:id])
    rescue ActiveRecord::RecordNotFound
      redirect_to root_path, info: 'Project not found.'
    end

    # Only allow a trusted parameter "white list" through.
    def project_params
      params.require(:project).permit(:title, :description, :due_date, member_ids: [])
    end
end

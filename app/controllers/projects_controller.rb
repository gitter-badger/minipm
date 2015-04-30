class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  # GET /projects
  def index
    @projects = Project.all
  end

  # GET /projects/1
  def show
    @unfinished_tasks = @project.tasks.where(finished: false)
    @finished_tasks = @project.tasks.where(finished: true)
  end

  # GET /projects/new
  def new
    @project = Project.new
  end

  # GET /projects/1/edit
  def edit
  end

  # POST /projects
  def create
    @project = Project.new(project_params)
    if params[:cancel]
      redirect_to projects_path
    elsif @project.save
      redirect_to @project, notice: 'Project was successfully created.'
    else
      render :new
    end

    # For debugging
    # byebug
    # render :new
  end

  # PATCH/PUT /projects/1
  def update
    if params[:cancel]
      redirect_to projects_path
    elsif @project.update(project_params)
      redirect_to @project, notice: 'Project was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /projects/1
  def destroy
    @project.destroy
    redirect_to projects_url, notice: 'Project was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def project_params
      params.require(:project).permit(:title, :description, :due_date, :project_image)
    end
end

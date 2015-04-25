class TasksController < ApplicationController
  before_action :set_project
  before_action :set_task, only: [:show, :edit, :finish]

  # GET /projects/1/task/new
  def new
    @task = @project.tasks.new
  end

  # GET /projects/1/tasks/1
  def show
  end

  # GET /projects/1/tasks/1/edit
  def edit
  end

  # POST /projects/1/tasks
  def create
    @task = @project.tasks.build(task_params)
    if @task.save
      redirect_to @project, notice: 'Task was successfully created.'
    else
      render :new
    end
  end

  # PUT /projects/1/tasks/1/finish
  def finish
    @task.update_attributes(finished: true)
    redirect_to @project
  end

  private

  # Set task id
  def set_task
    @task = @project.tasks.find(params[:id])
  end

  # Set project id
  def set_project
    @project = Project.find(params[:project_id])
  end

  # Strong parameters, only allow permitted paramaters
  def task_params
    params.require(:task).permit(:title, :description, :finished)
  end
end

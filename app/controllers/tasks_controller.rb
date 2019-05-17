class TasksController < ApplicationController
  before_action :set_current_task

  def index
    @tasks = Task.all
  end

  def show
    set_current_task
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.save
    redirect_to tasks_path
  end

  def edit
    set_current_task
  end

  def update
    set_current_task
    @task.update(task_params)
    redirect_to task_path(@task)
  end

  def destroy
    set_current_task
    @task.destroy
    redirect_to tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end

  def set_current_task
    if params[:id]
      @task = Task.find(params[:id])
    end
  end
end

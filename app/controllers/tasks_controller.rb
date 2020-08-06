class TasksController < ApplicationController

  skip_before_action :authorized, only: [:index]
  def index
    tasks = Task.all
    render json: tasks
  end

  def create 
    byebug
  end

end

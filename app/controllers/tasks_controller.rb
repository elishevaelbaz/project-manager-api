class TasksController < ApplicationController

  # skip_before_action :authorized, only: [:index]
  def index
    # tasks = Task.where(user_id: @current_user)
    board = Board.find(params[:board_id])
    
    tasks = board.tasks # see board model for the method definition
    render json: tasks
  end

  def show
    task = Task.find(params[:id])
      render json: task
  end

  def create 
    # byebug

    category = Category.find_by(name: params[:category])
    task = Task.create(name: params[:name], description: params[:description], created_by: @current_user.username, category_id: category.id, due_date: params[:due_date] )
    render json: task
  end

  def update
    task = Task.find(params[:id])
    #fix this so it's not just description
    task.update(description: params[:description] )
    render json: task


  end

  def destroy
    task = Task.find(params[:id])
    task.destroy
    render json: {message: "Task has been deleted", id: task.id}
  end

end

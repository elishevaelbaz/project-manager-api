class TasksController < ApplicationController

  # skip_before_action :authorized, only: [:index]
  def index
    # 
    # tasks = Task.where(user_id: @current_user)
    board = Board.find(params[:board_id])
    
    tasks = board.tasks # see board model for the method definition
    render json: tasks
  end

  def create 
    # byebug

    task = Task.create(name: params[:name], description: params[:description], created_by: @current_user.id, category_id: params[:category_id], due_date: params[:due_date] )
    render json: task
  end

end

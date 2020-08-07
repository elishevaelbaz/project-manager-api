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
    byebug
  end

end

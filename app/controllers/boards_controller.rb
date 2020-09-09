class BoardsController < ApplicationController

  # skip_before_action :authorized, only: [:index]
  def index
    boards = @current_user.boards
    render json: boards
  end

  def create 
    board = Board.create(name: params[:name], owner_id: @current_user.id)
    Membership.create(user_id:@current_user.id, board_id: board.id)
    render json: board
  end

end

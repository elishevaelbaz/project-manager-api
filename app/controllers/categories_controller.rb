class CategoriesController < ApplicationController

  # skip_before_action :authorized, only: [:index]
  def index
    current_board = Board.find(params[:board_id])
    # byebug
    categories = current_board.categories
    # categories = @current_user.boards.map(b)
    render json: categories
  end

end

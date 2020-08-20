class CategoriesController < ApplicationController

  # skip_before_action :authorized, only: [:index]
  def index
    current_board = Board.find(params[:board_id])
    # byebug
    categories = current_board.categories.order("id ASC") 
    # categories = @current_user.boards.map(b)
    render json: categories
  end

  def create 
    category = Category.create(name: params[:name], board_id: params[:board_id] )
    render json: category
  end

  def update
    category = Category.find(params[:id])

    category.update(name: params[:name])

    render json: category

  end
end

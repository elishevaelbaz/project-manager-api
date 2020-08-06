class BoardsController < ApplicationController

  skip_before_action :authorized, only: [:index]
  def index
    boards = Board.all
    render json: boards
  end

end

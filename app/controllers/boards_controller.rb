class BoardsController < ApplicationController

  # skip_before_action :authorized, only: [:index]
  def index
    boards = @current_user.boards
    
    render json: boards
  end

end

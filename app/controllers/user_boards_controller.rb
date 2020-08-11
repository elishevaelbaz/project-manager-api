class UserBoardsController < ApplicationController


  def index
    user_boards = UserBoard.all
    render json: user_boards
  end

  def create

    user = User.find_by(username: params[:username])

    # if the user exists
    if user.id
      user_board = UserBoard.create(user_id: user.id, board_id: params[:board_id])

      if user_board.valid?

        render json: user_board
      else # if user already belongs to the board
        render json: { messages: user_board.errors.full_messages}, status: :bad_request
      end

    # if user doesn't exist
    else
      render json: { messages: "User does not exist"}, status: :bad_request 
    end    

  end

end

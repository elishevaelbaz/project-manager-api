class MembershipsController < ApplicationController


  def index

     board = Board.find(params[:board_id])
    
     memberships = board.memberships 
     render json: memberships
  end

  def create
# byebug
    # if the user exists
    if User.exists?(username: params[:username])
      user = User.find_by(username: params[:username])

      membership = Membership.create(user_id: user.id, board_id: params[:board_id])

      if membership.valid?

        render json: membership
      else # if user already belongs to the board
        
        render json: { "status": "error", "error": "User is already a part of this project"}#, status: :bad_request
          end

    # if user doesn't exist
    else
      render json: { "status": "error", "error": "User does not exist"}#, status: :bad_request
    end    
  end
end
class MembershipsController < ApplicationController


  def index

     board = Board.find(params[:board_id])
    
     memberships = board.memberships 
     render json: memberships
  end

  def create

    user = User.find_by(username: params[:username])

    # if the user exists
    if user.id
      membership = Membership.create(user_id: user.id, board_id: params[:board_id])

      if membership.valid?

        render json: membership
      else # if user already belongs to the board
        render json: { messages: membership.errors.full_messages}, status: :bad_request
      end

    # if user doesn't exist
    else
      render json: { messages: "User does not exist"}, status: :bad_request 
    end    

  end

end

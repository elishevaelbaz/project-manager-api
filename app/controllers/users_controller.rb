class UsersController < ApplicationController

  skip_before_action :authorized, only: [:create, :login]
  # def index
  #   users = User.all
  #   render json: users
  # end

  def create
        # giving everyone an avatar when they are created (hardcoding)
    #     avatarNames = ["joe", "jenny", "steve", "elliot", "stevie", "christian", "matt"]
    avatarNames = [
      "helen", "jenny", "elliot", "stevie", "christian", "matt", "chris", "nan", "veronika", "joe", "tom", "steve", "daniel"
    ]

    projectedId = User.last.id + 1
    index = projectedId % avatarNames.length
    user = User.create(user_params.merge(avatar: avatarNames[index]))

    # user = User.create(user_params)
    if user.valid?
      session[:user_id] = user.id
      render json: user
    else 
      render json: { messages: user.errors.full_messages}, status: :bad_request
    end

  end


  # login
  def login

    user = User.find_by(username: params[:username])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      render json: user
    else 
      render json: { message: "Invalid username or password"}, status: :unauthorized
    end
  end

  #before_action :authorized
  # will have @current_user
  def autologin
    render json: @current_user
  end

  def logout
    session.delete(:user_id)

    render json: { message: "Successfully Logged Out"}
  end



  def user_params
    params.permit(:username, :password)
  end

end

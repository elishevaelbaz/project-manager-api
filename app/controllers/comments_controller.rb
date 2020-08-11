class CommentsController < ApplicationController

  def index
    # byebug
    # tasks = Task.where(user_id: @current_user)
    task = Task.find(params[:task_id])
    
    comments = task.comments 
    render json: comments
  end

#   # start with fetching comments eaach time click on task
#     def index
#       # 
#       # comments = comment.where(user_id: @current_user)
#       task = Task.find(params[:task_id])
      
#       comments = task.comments # see board model for the method definition
#       render json: comments
#     end
  
    def create   
      comment = Comment.create(text: params[:text], user_id: @current_user.id, task_id: params[:task_id])
      render json: comment
    end
  
#     def update
#       comment = comment.find(params[:id])
#       #fix this so it's not just description
#       comment.update(text: params[:text] )
#       render json: comment
  
  
#     end
  
    def destroy
      comment = comment.find(params[:id])
      comment.destroy
      render json: {message: "comment has been deleted", id: comment.id}
    end
  
  end
  


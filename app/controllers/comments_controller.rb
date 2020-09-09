class CommentsController < ApplicationController

  def index
    # tasks = Task.where(user_id: @current_user)
    # if params[:task_id]
    task = Task.find(params[:task_id])
    comments = task.comments
    # else
    #   comments = Comment.all
    # end 
    render json: comments
  end
  
    def create   
      comment = Comment.create(text: params[:text], user_id: @current_user.id, task_id: params[:task_id])
      render json: comment
    end
  
    def update
      comment = Comment.find(params[:id])
      comment.update(text: params[:text])
      render json: comment
    end
  
    def destroy
      comment = Comment.find(params[:id])
      comment.destroy
      render json: {message: "comment has been deleted", id: comment.id}
    end
  
  end
  


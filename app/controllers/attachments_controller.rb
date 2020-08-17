class AttachmentsController < ApplicationController

  def index
    task = Task.find(params[:task_id])
    attachments = task.attachments
    # else
    #   attachments = Attachment.all
    # end 
    render json: attachments
  end

  def create
    byebug
    image = Cloudinary::Uploader.upload(params[:image])
   
    attachment = Attachment.create(task_id: params[:task_id], image: image["url"], user_id: @current_user.id)
    # byebug
    render json: attachment

  end
  
end
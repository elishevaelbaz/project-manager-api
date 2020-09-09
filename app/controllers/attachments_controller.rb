class AttachmentsController < ApplicationController

  def index
    task = Task.find(params[:task_id])
    attachments = task.attachments 
    render json: attachments
  end

  def create
    image = Cloudinary::Uploader.upload(params[:image])
   
    attachment = Attachment.create(task_id: params[:task_id], image: image["url"], user_id: @current_user.id)
    render json: attachment

  end

  def destroy
    attachment = Attachment.find(params[:id])

    #image string example "http://res.cloudinary.com/ee-m5/image/upload/v1597692085/lfszm6o2jwn14g9ynxtl.jpg" 
    imageEnd = attachment.image.rpartition('/').last #lfszm6o2jwn14g9ynxtl.jpg
    public_id = imageEnd.rpartition(".").first

    Cloudinary::Uploader.destroy(public_id)
    attachment.destroy
    render json: {message: "Attachment has been deleted", id: attachment.id}
  end
  
end
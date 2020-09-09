class LabelsController < ApplicationController

  def create
    
    label = Label.create(name: params[:name], board_id: params[:board_id], color: params[:color])
  
    # if want to add label to this task at same time as creating it:
    # TaskLabel.create(task_id: params[:task_id], label_id: label.id)
    render json: label
  end

  def index
    board = Board.find(params[:board_id])
    labels = board.labels
    
    render json:labels
  end
end

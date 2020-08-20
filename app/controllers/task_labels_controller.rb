class TaskLabelsController < ApplicationController

  def create
    task_label = TaskLabel.create(task_id: params[:task_id], label_id: params[:label_id])
  
    render json: task_label
  end

  def index
    # byebug

    # if params[:board_id]
    #   board = Board.find(params[:board_id])
    #   tasks = board.tasks
    #   task_ids = tasks.map{ |task| task.id }
    #   task_labels = TaskLabel.where(task_id: task_ids)
    # else

      task_labels = TaskLabel.where(task_id: params[:task_id])

    # end
    
    render json: task_labels
  end

  def destroy
# byebug
    task_label = TaskLabel.find(params[:id])
    # byebug
    
    task_label.destroy
    render json: {message: "Label has been deleted from this task", id: task_label.id}
  end

end

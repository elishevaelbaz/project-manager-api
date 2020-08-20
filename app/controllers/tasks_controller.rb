class TasksController < ApplicationController

  # skip_before_action :authorized, only: [:index]
  def index
    # tasks = Task.where(user_id: @current_user)
    board = Board.find(params[:board_id])
    
    tasks = board.tasks # see board model for the method definition
    # becuase of ^ can't use .order
    # sorted_tasks = tasks.order("category_id ASC", "position ASC") 
    sorted_tasks = tasks.sort { |a, b| [a[:category_id], a[:position]] <=> [b[:category_id], b[:position]] }


    render json: sorted_tasks
  end

  def show
    task = Task.find(params[:id])
      render json: task
  end

  def create 
    # byebug

    # category = Category.find_by(name: params[:category])
    task = Task.create(name: params[:name], description: params[:description], created_by: @current_user.username, category_id: params[:category_id], due_date: params[:due_date], position: params[:position], assigned_to: params[:assigned_to] )
    if task.valid?
      render json: task
    else 
      render json: { "status": "error", "error": task.errors.full_messages.join(" ")}
    end
  end

  def update
    task = Task.find(params[:id])
    # byebug
    # category = Category.find_by(name: params[:category])
    task.update(name: params[:name], description: params[:description], category_id: params[:category_id], due_date: params[:due_date], position: params[:position], assigned_to: params[:assigned_to])
    # task.update(category_id: params[:category_id])

    # if they clear out the assigned to dropdown
    if params[:assigned_to] == ""
      task.update(assigned_to: nil)

    end

    if task.valid?
      render json: task
    else 
      render json: { "status": "error", "error": task.errors.full_messages.join(" ")}
    end


  end

  def updatePosition
    task = Task.find(params[:id])

    if params[:category_id]
      task.update(category_id: params[:category_id])
    end

    task.insert_at(params[:position])

    tasks = Task.where(category_id: [params[:category_id], params[:prev_category_id]]).order("category_id ASC, position ASC") 

    render json: tasks 
  end

  def destroy
    task = Task.find(params[:id])
    task.destroy
    render json: {message: "Task has been deleted", id: task.id}
  end

end


# def task_params
#   params.permit(:name, :description, :category_id, :due_date, :position)
# end
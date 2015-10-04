class TasksController < ApplicationController
  def new
    @list = List.find(params[:list_id])
    @task = Task.new
  end

  def create
    task = list.tasks.where(task_params).first_or_create
    if task.save
      flash[:notice] = "Task #{task.title} created"
      redirect_to lists_path
    else
      flash[:notice] = "Please try again"
      redirect_to lists_path
    end
  end

  def edit
    @list = List.find(params[:list_id])
    @task = Task.find(params[:id])
  end

  def update
    task = Task.find(params[:id])
    if task.update(task_params)
      flash[:notice] = "Task Updated Successfully"
      redirect_to lists_path
    else
      flash[:notice] = "Please try again"
      redirect_to lists_path
    end
  end

  def destroy
    list.tasks.find(params[:id]).destroy
    flash[:notice] = "Task removed"
    redirect_to lists_path
  end

  def task_complete
    task = list.tasks.find(params[:id])
    task.update(status: 'completed')
    flash[:notice] = "Task complete"
    redirect_to lists_path
  end

  private

  def list
    @list ||= List.find(params[:list_id])
  end

  def task_params
    params.require(:task).permit(:list_id, :title, :status, :description, :duedate)
  end
end

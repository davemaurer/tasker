class ListsController < ApplicationController
  def index
    @lists = List.where(archived: false)
    @tasks
  end

  def archived
    @lists = List.where(archived: true)
  end

  def show
    @list = List.find(params[:id])
  end

  def new
    @list = List.new
  end

  def create
    @list = current_user.lists.where(list_params).first_or_create
    if current_user && @list.save
      flash[:notice] = "List created!"
      redirect_to lists_path
    else
      flash.now[:notice] = "Please try again"
      render :new
    end
  end

  def edit
    @list = List.find(params[:id])
  end

  def update
    list = List.find(params[:id])
    if list.update(list_params)
      flash[:notice] = "List Updated Successfully"
      redirect_to lists_path
    else
      flash.now[:notice] = "Please try again"
      render :edit
    end
  end

  def destroy
    list = List.find(params[:id])
    list.destroy
    redirect_to archived_path
  end

  def archive
    list = List.find(params[:id])
    list.update(archived: true)
    flash[:notice] = "Your list has been archived"
    redirect_to lists_path
  end

  private

  def list_params
    params.require(:list).permit(:title, :archived)
  end
end

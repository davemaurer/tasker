class ListsController < ApplicationController
  def index
    @lists = List.where(archived: false)
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
      redirect_to dashboard_path
    else
      flash.now[:notice] = "Please try again"
      render :new
    end
  end

  private

  def list_params
    params.require(:list).permit(:title, :archived)
  end
end

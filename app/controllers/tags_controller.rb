class TagsController < ApplicationController
  def index
    @tags = Tag.all
  end

  def show
    @tag = Tag.find(params[:id])
  end

  def filtered
    @tasks = Task.find(params[:id])
    @tag = Tag.find(params[:id])
  end
end

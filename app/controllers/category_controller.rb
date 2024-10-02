class CategoryController < ApplicationController

  def index
    @categories = Category.all
    render template: "categories/index"
  end

  def show
    @category = Category.find_by(id:params["id"])
    render template: "categories/show"
  end

  def create
    @category = Category.new(
      name: params[:name]
    )
    if @category.save
      render template: "categories/show"
    else
      render json: {message: @category.errors.full_messages}
    end
  end

  def update
    @category = Category.find_by(id:params["id"])
    @category.name = params[:name] || @category.name
    @category.save
    render template: "categories/show"
  end

  def destroy
    @category = Category.find_by(id:params["id"])
    @category.destroy
    render json: {message: "your category has been deleted"}
  end
end

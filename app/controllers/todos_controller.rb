class TodosController < ApplicationController
  def index
    @todos = Todo.all
    render :index
  end
  def create
    @todo =Todo.new(
      user_id: params[:user_id],
      category_id: params[:category_id],
      title: params[:title],
      description: params[:description],
      deadline: params[:deadline],
      completed: params[:completed],
    )
    if @todo.save
      render :show
    else
      render json: {errors: @todo.errors.full_messages}, status: :unprocessable_entity
    end
  end
  def show
    @todo = Todo.find_by(id: params[:id])
    render :show
  end

  def update
    #placeholder
  end
  def destroy
    #placeholder
  end
end

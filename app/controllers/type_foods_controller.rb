class TypeFoodsController < ApplicationController
  def new
    @type_food = TypeFood.new
  end

  def create
    @type_food = TypeFood.new(type_food_params)
    if @type_food.save
      redirect_to @type_food
    else
      render 'new'
    end
  end

  def show
    @type_food = TypeFood.find(params[:id])
  end

  private

  def type_food_params
    params.require(:type_food).permit(:name)
  end
end

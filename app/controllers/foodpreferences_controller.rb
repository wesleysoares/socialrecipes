class FoodpreferencesController < ApplicationController
  def new
    @foodpreference = Foodpreference.new
  end

  def create
    @foodpreference = Foodpreference.new(foodpreference_params)
    if @foodpreference.save
      redirect_to @foodpreference
    else
      render 'new'
    end
  end

  def show
    @foodpreference = Foodpreference.find(params[:id])
  end

  private

  def foodpreference_params
    params.require(:foodpreference).permit(:name)
  end
end

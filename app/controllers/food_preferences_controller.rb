class FoodPreferencesController < ApplicationController
  def new
    @foodpreference = FoodPreference.new
  end

  def create
    @foodpreference = FoodPreference.new(foodpreference_params)
    if @foodpreference.save
      redirect_to @foodpreference
    else
      render 'new'
    end
  end

  def show
    @foodpreference = FoodPreference.find(params[:id])
  end

  private

  def foodpreference_params
    params.require(:food_preference).permit(:name)
  end
end

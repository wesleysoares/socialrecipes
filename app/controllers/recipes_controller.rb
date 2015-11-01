class RecipesController < ApplicationController
  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipes_params)
    if @recipe.save
      redirect_to @recipe
    else
      flash.now[:error] = 'Preencha os campos!'
      render 'new'
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  private

  def recipes_params
    params.require(:recipe).permit(:name_recipe,
                                   :kitchen,
                                   :type_food,
                                   :food_preference,
                                   :amount_people,
                                   :preparation_time,
                                   :difficulty,
                                   :ingredients,
                                   :preparation,
                                   :image)
  end
end
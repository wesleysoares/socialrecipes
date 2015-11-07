class AddFoodprCeferenceRefToRecipes < ActiveRecord::Migration
  def change
    add_reference :recipes, :foodpreference, index: true, foreign_key: true
  end
end

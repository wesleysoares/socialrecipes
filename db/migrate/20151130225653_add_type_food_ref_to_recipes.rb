class AddTypeFoodRefToRecipes < ActiveRecord::Migration
  def change
    remove_reference :recipes, :typefood, index: true, foreign_key: true
    add_reference :recipes, :type_food, index: true, foreign_key: true
  end
end

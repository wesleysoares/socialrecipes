class RemoveTypefoodFromRecipe < ActiveRecord::Migration
  def change
    remove_column :recipes, :type_food, :string
  end
end

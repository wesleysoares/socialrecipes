class RemoveKitchenFromRecipe < ActiveRecord::Migration
  def change
    remove_column :recipes, :kitchen, :string
  end
end

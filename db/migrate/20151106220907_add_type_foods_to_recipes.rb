class AddTypeFoodsToRecipes < ActiveRecord::Migration
  def change
    add_reference :recipes, :typefood, index: true, foreign_key: true
  end
end

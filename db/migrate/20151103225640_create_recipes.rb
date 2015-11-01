class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :name_recipe
      t.string :kitchen
      t.string :type_food
      t.string :food_preference
      t.integer :amount_people
      t.integer :preparation_time
      t.string :difficulty
      t.text :ingredients
      t.text :preparation
      t.attachment :image
      t.timestamps null: false
    end
  end
end

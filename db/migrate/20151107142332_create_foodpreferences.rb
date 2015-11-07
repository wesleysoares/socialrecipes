class CreateFoodpreferences < ActiveRecord::Migration
  def change
    create_table :foodpreferences do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end

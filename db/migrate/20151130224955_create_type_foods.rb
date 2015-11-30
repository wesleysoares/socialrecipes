class CreateTypeFoods < ActiveRecord::Migration
  def change
    create_table :type_foods do |t|

      t.timestamps null: false
    end
  end
end

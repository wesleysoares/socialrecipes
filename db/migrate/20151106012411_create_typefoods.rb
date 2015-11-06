class CreateTypefoods < ActiveRecord::Migration
  def change
    create_table :typefoods do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end

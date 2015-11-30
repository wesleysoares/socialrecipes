class AddNameToTypeFood < ActiveRecord::Migration
  def change
    add_column :type_foods, :name, :string
  end
end

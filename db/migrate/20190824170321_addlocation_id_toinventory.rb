class AddlocationIdToinventory < ActiveRecord::Migration[5.0]
  def change
    add_column :inventories, :location_id, :integer
  end
end

class AddProductIdToInventory < ActiveRecord::Migration[5.0]
  def change
    add_column :inventories, :product_id, :integer
    remove_column :inventories, :store_id, :integer
  end
end

class AddStoreIdToInventory < ActiveRecord::Migration[5.0]
  def change
    add_column :inventories, :store_id, :integer
    remove_column :inventories, :store_good_id, :integer
    add_column :inventories, :status, :string
  end
end

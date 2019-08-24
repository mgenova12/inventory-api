class AddStoreIdToInvent < ActiveRecord::Migration[5.0]
  def change
    add_column :inventories, :store_id, :integer
  end
end

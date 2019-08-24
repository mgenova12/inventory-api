class AddStoreGoodId < ActiveRecord::Migration[5.0]
  def change
    remove_column :inventories, :product_id, :integer
    add_column :inventories, :store_good_id, :integer
  end
end

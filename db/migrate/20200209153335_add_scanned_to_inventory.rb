class AddScannedToInventory < ActiveRecord::Migration[5.0]
  def change
    add_column :inventories, :scanned, :boolean
  end
end

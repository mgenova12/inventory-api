class AddinvoicedQuanitity < ActiveRecord::Migration[5.0]
  def change
    add_column :inventories, :invoiced_quantity, :integer, default: 0
  end
end

class CreateInventories < ActiveRecord::Migration[5.0]
  def change
    create_table :inventories do |t|
      t.integer :store_good_id
      t.integer :order_id
      t.integer :quantity
      t.integer :quantity_needed

      t.timestamps
    end
    remove_column :products, :prepped_id, :integer
  end
end

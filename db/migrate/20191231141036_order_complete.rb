class OrderComplete < ActiveRecord::Migration[5.0]
  def change
    add_column :store_orders, :orders_complete, :integer
  end
end

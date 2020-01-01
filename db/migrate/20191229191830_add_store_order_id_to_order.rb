class AddStoreOrderIdToOrder < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :store_order_id, :integer
    rename_column :store_orders, :delievry_date, :delivery_date

  end
end

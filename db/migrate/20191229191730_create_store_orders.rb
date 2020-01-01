class CreateStoreOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :store_orders do |t|
      t.datetime :delievry_date
      t.string :status

      t.timestamps
    end
  end
end

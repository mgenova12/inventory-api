class AddPriceToProduct < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :price, :decimal, :precision => 8, :scale => 2
    rename_column :products, :measurement, :measurement_id
    rename_column :products, :item_type, :product_type_id
    rename_column :products, :distributor, :distributor_id
  end
end

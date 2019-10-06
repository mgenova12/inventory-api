class AddAmountInStockToStoreGood < ActiveRecord::Migration[5.0]
  def change
    add_column :store_goods, :amount_in_stock, :integer
  end
end

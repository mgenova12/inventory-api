class RemoveAmountInStock < ActiveRecord::Migration[5.0]
  def change
    remove_column :products, :measurement_id, :integer
    remove_column :products, :product_type_id, :integer
    remove_column :products, :amount_in_stock, :integer
  end
end

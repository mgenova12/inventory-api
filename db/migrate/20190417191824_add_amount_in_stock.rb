class AddAmountInStock < ActiveRecord::Migration[5.0]
  def change
    change_column :products, :measurement_id, 'integer USING CAST(measurement_id AS integer)'
    change_column :products, :product_type_id, 'integer USING CAST(product_type_id AS integer)'
    change_column :products, :case_quantity, 'integer USING CAST(case_quantity AS integer)'
    change_column :products, :distributor_id, 'integer USING CAST(distributor_id AS integer)'
    add_column :products, :amount_in_stock, :integer
  end
end

class AddPortionSizeToProduct < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :portion_size, :integer 
    add_column :products, :marked_up_price, :decimal, precision: 8, scale: 2 
  end
end

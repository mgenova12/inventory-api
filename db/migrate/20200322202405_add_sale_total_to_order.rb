class AddSaleTotalToOrder < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :sale_total, :decimal
  end
end

class AddPIdToProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :p_id, :integer
    add_column :orders, :message, :text
    add_column :store_goods, :replenish_by, :string
  end
end

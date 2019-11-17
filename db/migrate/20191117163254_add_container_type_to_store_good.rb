class AddContainerTypeToStoreGood < ActiveRecord::Migration[5.0]
  def change
    add_column :store_goods, :container_type_id, :integer
  end
end

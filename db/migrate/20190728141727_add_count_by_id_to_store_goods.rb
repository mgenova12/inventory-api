class AddCountByIdToStoreGoods < ActiveRecord::Migration[5.0]
  def change
    add_column :store_goods, :count_by_id, :integer
  end
end

class AddStoreTypeToStore < ActiveRecord::Migration[5.0]
  def change
    remove_column :stores, :store_type, :string
    add_column :stores, :store_type_id, :integer
  end
end

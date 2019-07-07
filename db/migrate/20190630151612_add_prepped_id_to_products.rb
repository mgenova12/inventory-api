class AddPreppedIdToProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :prepped_id, :integer
  end
end

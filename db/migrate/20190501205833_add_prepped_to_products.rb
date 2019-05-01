class AddPreppedToProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :count_by_id, :integer
    add_column :products, :category_id, :integer
    add_column :products, :prepped, :boolean

  end
end

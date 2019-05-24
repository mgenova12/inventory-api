class AddProductDetailFeilds < ActiveRecord::Migration[5.0]
  def change
    remove_column :products, :count_by_id, :integer
    add_column :products, :barcode, :integer 
    add_column :products, :description, :text
    add_column :products, :distributor_number, :integer
    add_column :products, :brand, :string
    add_column :products, :unit_size, :string

  end
end

class ChangeProductsBarcodeToBigint < ActiveRecord::Migration[5.0]
  def change
    change_column :products, :barcode, :bigint
  end
end

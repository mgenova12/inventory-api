class AddRowOrderToLocations < ActiveRecord::Migration[5.0]
  def change
    add_column :locations, :row_order, :integer
  end
end

class ChangeDnumberToString < ActiveRecord::Migration[5.0]
  def change
    change_column :products, :distributor_number, :string
  end
end

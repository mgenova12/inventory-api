class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :measurement
      t.string :item_type
      t.string :case_quantity
      t.string :distributor

      t.timestamps
    end
  end
end

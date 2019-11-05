class AddAisleAndDaysTillExpire < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :aisle_number, :integer
    add_column :products, :days_till_expire, :integer
  end
end

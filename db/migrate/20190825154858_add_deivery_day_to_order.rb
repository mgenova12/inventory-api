class AddDeiveryDayToOrder < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :delivery_day, :string
  end
end

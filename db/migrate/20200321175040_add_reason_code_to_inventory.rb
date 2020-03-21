class AddReasonCodeToInventory < ActiveRecord::Migration[5.0]
  def change
    add_column :inventories, :reason_code, :string
  end
end

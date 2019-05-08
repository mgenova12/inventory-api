class AddMarkUptoProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :mark_up, :integer
  end
end

class AddTextToDocument < ActiveRecord::Migration[5.0]
  def change
    change_column :documents, :document, :text
  end
end

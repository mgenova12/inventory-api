class AddDocumentIdToProduct < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :document_id, :integer
    remove_column :documents, :product_id, :integer
  end
end

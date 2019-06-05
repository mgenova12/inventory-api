class RemoveDocumentIdToProduct < ActiveRecord::Migration[5.0]
  def change
    remove_column :products, :document_id, :integer
    add_column :documents, :product_id, :integer
  end
end

class ChangeDocumentToString < ActiveRecord::Migration[5.0]
  def change
    change_column :documents, :document, :string
  end
end

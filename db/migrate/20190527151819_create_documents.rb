class CreateDocuments < ActiveRecord::Migration[5.0]
  def change
    create_table :documents do |t|
      t.references :product, foreign_key: true
      t.string :document

      t.timestamps
    end
  end
end

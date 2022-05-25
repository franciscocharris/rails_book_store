class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books, id: false do |t|
      t.uuid :code, primary_key: true
      t.string :name
      t.text :description
      t.decimal :price, precision: 8, scale: 2
      t.integer :n_pages
      t.date :d_published
      t.boolean :active, default: false
      t.references :author, null: false, foreign_key: true

      t.timestamps
    end
  end
end

class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.text :message
      t.boolean :approved, default: false
      t.uuid :book_code
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
    add_index :comments, :book_code
  end
end

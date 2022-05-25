class CreateRequests < ActiveRecord::Migration[6.1]
  def change
    create_table :requests do |t|
      t.references :user, null: false, foreign_key: true
      t.uuid :book_code
      t.timestamps
    end
    add_index :requests, :book_code
  end
end

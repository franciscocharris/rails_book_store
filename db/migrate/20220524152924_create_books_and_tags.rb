# frozen_string_literal: true

class CreateBooksAndTags < ActiveRecord::Migration[6.1]
  def change
    create_table :books_tags, id: false do |t|
      t.uuid :book_code
      t.belongs_to :tag
      t.timestamps
    end
    add_index :books_tags, :book_code
  end
end

class BooksTag < ApplicationRecord
  belongs_to :book, foreign_key: 'book_code'
  belongs_to :tag
end
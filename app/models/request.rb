class Request < ApplicationRecord
  belongs_to :user
  belongs_to :book, foreign_key: 'book_code'
end

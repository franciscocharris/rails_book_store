class Comment < ApplicationRecord
  belongs_to :book, foreign_key: 'book_code'
  belongs_to :user
  validates :message, presence: true
end

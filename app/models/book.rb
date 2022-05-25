# frozen_string_literal: true

class Book < ApplicationRecord
  self.primary_key = :code
  belongs_to :author
  has_many :books_tags, foreign_key: 'book_code'
  has_many :tags, through: :books_tags, dependent: :destroy
  has_many :comments, foreign_key: 'book_code'
  validates :name, :price, :n_pages, :d_published, :author, presence: true
  validates :name, length: { maximum: 30 },
                   format: { with: /\A[a-zA-Z0-9 ]+\z/, message: 'the name has specials characters' }
  validates :price, numericality: true, format: { with: /\A\d+(?:\.\d{0,2})?\z/ }
  validates :n_pages, numericality: true
  attr_accessor :tag_elements

  def save_tags
    return books_tags.destroy_all if tag_elements.empty? || tag_elements.nil?

    books_tags.where.not(tag_id: tag_elements).destroy_all
    tag_elements.each do |tag_id|
      BooksTag.find_or_create_by!(book: self, tag_id:)
    end
  end
end

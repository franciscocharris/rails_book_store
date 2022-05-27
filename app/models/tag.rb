# frozen_string_literal: true

class Tag < ApplicationRecord
  belongs_to :author, dependent: :destroy
  has_many :books_tags
  has_many :books, through: :books_tags, dependent: :destroy
end

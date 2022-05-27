# frozen_string_literal: true

class Author < ApplicationRecord
  belongs_to :user
  has_many :tags, dependent: :destroy
  has_many :books, dependent: :destroy
end

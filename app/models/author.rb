class Author < ApplicationRecord
  belongs_to :user, dependent: :destroy
  has_many :tags
end

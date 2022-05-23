class Author < ApplicationRecord
  belongs_to :user, dependent: :destroy
end

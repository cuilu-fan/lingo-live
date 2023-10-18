class Category < ApplicationRecord
  validates :name, presence: true
  has_many :user_flashcards
end

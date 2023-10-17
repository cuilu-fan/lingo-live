class Translation < ApplicationRecord
  validates :primary_language_word, presence: true
  validates :target_language_word, presence: true
  has_many :user_flashcards
end

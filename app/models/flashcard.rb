class Flashcard < ApplicationRecord
  validates :primary_language_word, presence: true
  validates :target_language_word, presence: true
end

class UserFlashcard < ApplicationRecord
  belongs_to :user
  belongs_to :translation
  belongs_to :category

  def self.flashcards_to_review(user, category)
    where(user:, category:, known: false)
      .joins(:translation)
      .order(:success_count, :failed_count)
  end
end

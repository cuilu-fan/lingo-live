class RemoveFlashcardIdFromUserFlashcards < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :user_flashcards, :flashcard_id
  end
end

class RemoveFlashRefFromUserFlashcards < ActiveRecord::Migration[7.0]
  def change
    remove_reference :user_flashcards, :flashcard, null: false, foreign_key: false
  end
end

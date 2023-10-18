class AddTranslationRefToUserFlashcards < ActiveRecord::Migration[7.0]
  def change
    add_reference :user_flashcards, :translation, null: false, foreign_key: true
  end
end

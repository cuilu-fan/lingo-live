class CreateUserFlashcards < ActiveRecord::Migration[7.0]
  def change
    create_table :user_flashcards do |t|
      t.references :user, null: false, foreign_key: true
      t.references :flashcard, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true
      t.boolean :success
      t.boolean :failed

      t.timestamps
    end
  end
end

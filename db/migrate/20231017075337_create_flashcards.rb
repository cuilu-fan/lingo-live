class CreateFlashcards < ActiveRecord::Migration[7.0]
  def change
    create_table :flashcards do |t|
      t.string :primary_language_word
      t.string :target_language_word
      t.boolean :default

      t.timestamps
    end
  end
end

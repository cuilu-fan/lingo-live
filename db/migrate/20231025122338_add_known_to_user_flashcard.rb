class AddKnownToUserFlashcard < ActiveRecord::Migration[7.0]
  def change
    add_column :user_flashcards, :known
  end
end

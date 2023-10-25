class ChangeColumnDefaultToUserFlashcard < ActiveRecord::Migration[7.0]
  def change
    change_column_default :user_flashcards, :known, false
  end
end

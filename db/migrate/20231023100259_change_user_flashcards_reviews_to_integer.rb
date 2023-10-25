class ChangeUserFlashcardsReviewsToInteger < ActiveRecord::Migration[7.0]
  def change
    change_column :user_flashcards, :success, :integer, default: 0, :using => 'case when success then 1 else 0 end'
    change_column :user_flashcards, :failed, :integer, default: 0, :using => 'case when failed then 1 else 0 end'
  end
end

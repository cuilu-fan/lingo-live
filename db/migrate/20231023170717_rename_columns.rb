class RenameColumns < ActiveRecord::Migration[7.0]
  def change
    change_table(:user_flashcards) do |t|
      t.rename(:success, :success_count)
      t.rename(:failed, :failed_count)
    end
  end
end

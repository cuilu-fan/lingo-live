class AddFriendRefToMessages < ActiveRecord::Migration[7.0]
  def change
    add_reference :messages, :friend, null: false, foreign_key: true
  end
end

class AddChatroomReferencesToMessages < ActiveRecord::Migration[7.0]
  def change
    add_reference :messages, :chatroom, null: false, foreign_key: true
    remove_reference :messages, :friend, null: false, foreign_key: true
    add_reference :messages, :sender, null: false, foreign_key: { to_table: :users }
  end
end

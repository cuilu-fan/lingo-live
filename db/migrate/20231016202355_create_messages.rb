class CreateMessages < ActiveRecord::Migration[7.0]
  def change
    create_table :messages do |t|
      t.string :text
      t.integer :friend_id

      t.timestamps
    end
  end
end

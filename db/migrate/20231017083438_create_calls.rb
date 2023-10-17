class CreateCalls < ActiveRecord::Migration[7.0]
  def change
    create_table :calls do |t|
      t.integer :duration
      t.references :caller, null: false, foreign_key: { to_table: :users }
      t.references :random_user, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end

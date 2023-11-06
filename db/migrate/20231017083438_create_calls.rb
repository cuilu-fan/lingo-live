class CreateCalls < ActiveRecord::Migration[7.0]
  def change
    create_table :calls do |t|
      t.integer :duration
      t.references :caller, null: true, foreign_key: { to_table: :users }
      t.references :random_user, null: true, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end

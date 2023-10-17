class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.integer :rating
      t.references :reviewer, foreign_key: { to_table: :users }
      t.references :reviewee, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end

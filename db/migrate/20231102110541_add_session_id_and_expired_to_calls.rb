class AddSessionIdAndExpiredToCalls < ActiveRecord::Migration[7.0]
  def change
    add_column :calls, :session_id, :string, null: false
    add_column :calls, :expired, :boolean, default: false
  end
end

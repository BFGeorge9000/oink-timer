class AddTimerIdToNotification < ActiveRecord::Migration
  def change
    add_column :notifications, :timer_id, :integer
    add_index :notifications, :timer_id
  end
end

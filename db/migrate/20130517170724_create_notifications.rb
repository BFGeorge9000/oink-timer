class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.string :type
      t.string :destination

      t.timestamps
    end
  end
end

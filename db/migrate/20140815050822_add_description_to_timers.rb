class AddDescriptionToTimers < ActiveRecord::Migration
  def change
    add_column :timers, :description, :string
  end
end

class SetDefaultReadForNotifications < ActiveRecord::Migration[8.0]
  def change
    change_column :notifications, :read, :boolean, default: false, null: false
  end
end

class FillNullReadInNotifications < ActiveRecord::Migration[8.0]
  def up
    # Set all existing NULL values in read column to false
    execute <<-SQL
      UPDATE notifications
      SET read = false
      WHERE read IS NULL;
    SQL
  end

  def down
    # Optional rollback: do nothing
  end
end

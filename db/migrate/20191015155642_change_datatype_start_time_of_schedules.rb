class ChangeDatatypeStartTimeOfSchedules < ActiveRecord::Migration[5.2]
  def change
    change_column :schedules, :start_time, :string
  end
end

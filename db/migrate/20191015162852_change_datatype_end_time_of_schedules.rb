class ChangeDatatypeEndTimeOfSchedules < ActiveRecord::Migration[5.2]
  def change
    change_column :schedules, :end_time, :string
  end
end

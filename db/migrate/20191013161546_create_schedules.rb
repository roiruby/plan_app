class CreateSchedules < ActiveRecord::Migration[5.2]
  def change
    create_table :schedules do |t|
      t.string :schedule_title
      t.time :start_time
      t.time :end_time
      t.text :content
      t.string :spot_name
      t.string :address
      t.string :access
      t.string :business_hour
      t.references :plan, foreign_key: true
      t.string :regular_holiday
      t.string :tel
      t.string :parking
      t.string :budget
      t.string :link_url
      t.string :comment

      t.timestamps
    end
  end
end

class AddSubTitleToSchedules < ActiveRecord::Migration[5.2]
  def change
    add_column :schedules, :sub_title, :string
  end
end

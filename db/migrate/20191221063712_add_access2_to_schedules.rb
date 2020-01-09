class AddAccess2ToSchedules < ActiveRecord::Migration[5.2]
  def change
    add_column :schedules, :access2, :string
  end
end

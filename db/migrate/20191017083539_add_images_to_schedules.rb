class AddImagesToSchedules < ActiveRecord::Migration[5.2]
  def change
    add_column :schedules, :image1, :string
    add_column :schedules, :image2, :string
    add_column :schedules, :image3, :string
    add_column :schedules, :image4, :string
  end
end

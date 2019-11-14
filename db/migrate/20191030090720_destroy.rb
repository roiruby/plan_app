class Destroy < ActiveRecord::Migration[5.2]
  def change
    drop_table :plans_keywords
  end
end

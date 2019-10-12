class CreatePlans < ActiveRecord::Migration[5.2]
  def change
    create_table :plans do |t|
      t.string :plan_title
      t.string :content
      t.references :user, foreign_key: true
      t.string :image

      t.timestamps
    end
  end
end

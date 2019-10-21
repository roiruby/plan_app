class AddCategoryRefToPlans < ActiveRecord::Migration[5.2]
  def change
    add_reference :plans, :category, foreign_key: true
  end
end

class AddBudgetRefToPlans < ActiveRecord::Migration[5.2]
  def change
    add_reference :plans, :budget, foreign_key: true
  end
end

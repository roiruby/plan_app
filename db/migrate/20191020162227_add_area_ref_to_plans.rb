class AddAreaRefToPlans < ActiveRecord::Migration[5.2]
  def change
    add_reference :plans, :area, foreign_key: true
  end
end

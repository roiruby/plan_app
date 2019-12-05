class AddPrefectureRefToPlans < ActiveRecord::Migration[5.2]
  def change
    add_reference :plans, :prefecture, foreign_key: true
    add_reference :plans, :city, foreign_key: true
    add_reference :plans, :spot, foreign_key: true
  end
end

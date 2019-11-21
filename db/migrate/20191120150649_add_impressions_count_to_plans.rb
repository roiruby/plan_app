class AddImpressionsCountToPlans < ActiveRecord::Migration[5.2]
  def change
    add_column :plans, :impressions_count, :integer, default: 0
  end
end

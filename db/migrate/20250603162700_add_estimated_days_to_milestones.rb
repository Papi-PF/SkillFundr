class AddEstimatedDaysToMilestones < ActiveRecord::Migration[7.2]
  def change
    add_column :milestones, :estimated_days, :integer
  end
end

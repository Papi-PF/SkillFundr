class AddMetadataToMilestones < ActiveRecord::Migration[7.2]
  def change
    add_column :milestones, :metadata, :text
  end
end

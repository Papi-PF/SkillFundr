class RemoveRoadmapAndEstimatedDurationFromSkills < ActiveRecord::Migration[7.2]
  def change
    remove_column :skills, :roadmap, :text
    remove_column :skills, :estimated_duration, :string
  end
end

class RemoveRoadmapFromSkills < ActiveRecord::Migration[7.2]
  def change
    remove_column :skills, :roadmap, :text
  end
end

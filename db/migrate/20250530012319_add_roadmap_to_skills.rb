class AddRoadmapToSkills < ActiveRecord::Migration[7.2]
  def change
    add_column :skills, :roadmap, :text
  end
end

class AddEstimatedDurationToSkills < ActiveRecord::Migration[7.2]
  def change
    add_column :skills, :estimated_duration, :string
  end
end

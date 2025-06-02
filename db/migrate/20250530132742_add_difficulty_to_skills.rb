class AddDifficultyToSkills < ActiveRecord::Migration[7.2]
  def change
    add_column :skills, :difficulty, :string
  end
end

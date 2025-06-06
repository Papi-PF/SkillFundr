class SetDefaultDifficultyForSkills < ActiveRecord::Migration[7.2]
  def change
    change_column_default :skills, :difficulty, "Beginner"

    Skill.where(difficulty: nil).update_all(difficulty: "Beginner")
  end
end

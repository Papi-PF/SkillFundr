class AddAiGeneratedToLearningPaths < ActiveRecord::Migration[7.2]
  def change
    add_column :learning_paths, :ai_generated, :boolean, default: false
  end
end

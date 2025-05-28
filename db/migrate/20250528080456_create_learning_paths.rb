class CreateLearningPaths < ActiveRecord::Migration[7.2]
  def change
    create_table :learning_paths do |t|
      t.references :user, null: false, foreign_key: true
      t.references :skill, null: false, foreign_key: true

      t.timestamps
    end
  end
end

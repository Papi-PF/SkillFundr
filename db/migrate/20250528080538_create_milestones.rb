class CreateMilestones < ActiveRecord::Migration[7.2]
  def change
    create_table :milestones do |t|
      t.string :title
      t.text :description
      t.boolean :completed
      t.integer :position
      t.references :learning_path, null: false, foreign_key: true

      t.timestamps
    end
  end
end

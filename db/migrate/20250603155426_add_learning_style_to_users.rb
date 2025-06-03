class AddLearningStyleToUsers < ActiveRecord::Migration[7.2]
  def change
    add_column :users, :learning_style, :string
  end
end

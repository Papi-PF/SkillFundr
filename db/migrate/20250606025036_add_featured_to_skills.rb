class AddFeaturedToSkills < ActiveRecord::Migration[7.2]
  def change
    add_column :skills, :featured, :boolean, default: false
    add_index :skills, :featured
  end
end

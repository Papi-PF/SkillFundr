class Skill < ApplicationRecord
  # Skill can be a part of many learning paths
  has_many :learning_paths
end

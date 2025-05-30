class Skill < ApplicationRecord
  # Skill can be a part of many learning paths
  has_many :learning_paths
  has_many :milestones, through: :learning_paths

  validates :name, presence: true
  validates :description, presence: true
  validates :roadmap, presence: true
  validates :estimated_duration, presence: true
end

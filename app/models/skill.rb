class Skill < ApplicationRecord
  # Skill can be a part of many learning paths
  has_many :learning_paths
  has_many :milestones, through: :learning_paths

  scope :featured, -> { where(featured: true).order(created_at: :desc) }

  # Define the difficulty enum
  enum difficulty: {
    beginner: "Beginner",
    intermediate: "Intermediate",
    advanced: "Advanced"
  }

  validates :name, presence: true
  validates :description, presence: true
end

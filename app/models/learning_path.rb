class LearningPath < ApplicationRecord
  # Learning path belongs to a user and a skill
  belongs_to :user
  belongs_to :skill

  # Learning path has many milestones
  has_many :milestones, dependent: :destroy

  # makes sure both user and skill are present when learning path is created
  validates :user, presence: true
  validates :skill, presence: true
end

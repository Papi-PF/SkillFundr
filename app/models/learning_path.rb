class LearningPath < ApplicationRecord
  # Learning path belongs to a user and a skill
  belongs_to :user
  belongs_to :skill

  # Learning path has many milestones
  has_many :milestones, dependent: :destroy

  def completed_milestones_count
    milestones.where(completed: true).count
  end

  def completion_percentage
    return 0 if milestones.empty?
    (completed_milestones_count.to_f / milestones.count) * 100
  end

  # makes sure both user and skill are present when learning path is created
  validates :user, presence: true
  validates :skill, presence: true
  # validates :skill_id, uniqueness: { scope: :user_id }
end

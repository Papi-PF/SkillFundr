class LearningPath < ApplicationRecord
  belongs_to :user
  belongs_to :skill
  has_many :milestones, dependent: :destroy

  validates :user, presence: true
  validates :skill, presence: true
end

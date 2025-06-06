class User < ApplicationRecord
  has_many :learning_paths, dependent: :destroy
  has_many :skills, through: :learning_paths

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Check if user has completed at least 3 different skills
  def update_funding_eligibility!
    completed_skills_count = learning_paths.joins(:milestones)
                                         .where(milestones: { completed: true })
                                         .select(:skill_id)
                                         .distinct
                                         .count

    update(funding_eligibility: completed_skills_count >= 3)
  end

  # Helper method to check completed skills count
  def completed_skills_count
    learning_paths.joins(:milestones)
                 .where(milestones: { completed: true })
                 .select(:skill_id)
                 .distinct
                 .count
  end

  # Predicate method for funding eligibility
  def funding_eligibility?
    funding_eligibility
  end
end

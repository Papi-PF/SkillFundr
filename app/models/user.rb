class User < ApplicationRecord
  has_many :learning_paths, dependent: :destroy
  has_many :skills, through: :learning_paths
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def update_funding_eligibility!
    if learning_paths.joins(:milestones)
                     .where(milestones: { completed: true })
                     .count >= 2
      update(funding_eligibility: true)
    end
  end

  validates :funding_eligibility, inclusion: { in: [true, false] }

  def funding_eligibility?
    funding_eligibility
  end
end

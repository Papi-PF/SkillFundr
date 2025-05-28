class Skill < ApplicationRecord
  has_many :learning_paths
  has_many :users, through: :learning_paths
  validates :name, presence: true, uniqueness: true
  validates :description, length: { maximum: 500 }
end

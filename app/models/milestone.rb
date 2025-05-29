class Milestone < ApplicationRecord
  # Each milestone belongs to one learning path
  belongs_to :learning_path

  # Makes sure the milestone has a title and a valid position number
  validates :title, presence: true
  validates :position, numericality: { only_integer: true }
end

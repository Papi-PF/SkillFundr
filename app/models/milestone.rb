class Milestone < ApplicationRecord
  belongs_to :learning_path

  validates :title, presence: true
  validates :position, numericality: { only_integer: true }
end

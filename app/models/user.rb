class User < ApplicationRecord
  has_many :learning_paths, dependent: :destroy
  has_many :skills, through: :learning_paths
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end

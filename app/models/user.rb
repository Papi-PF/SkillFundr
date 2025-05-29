class User < ApplicationRecord
<<<<<<< HEAD
  has_many :learning_paths, dependent: :destroy
=======
  # User can have many learning paths.
  has_many :learning_paths

  # User can access many skills via learning paths.
>>>>>>> master
  has_many :skills, through: :learning_paths
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end

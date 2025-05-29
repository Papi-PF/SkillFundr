class LearningPathsController < ApplicationController
  before_action :authenticate_user!

  # POST /learning_paths/1
  def create
    # Create a new learning part for log-in user
    # from the form the skill id will come as a top parameter
    @learning_path = current_user.learning_paths.new(skill_id: params[:skill_id])

    # Save the learning path
    if @learning_path.save
      # If it works, redirect to show page of new learning path
      redirect_to learning_path_path(@learning_path), notice: "Your learning path has been created!"
    else
      # If not redict back to home
      redirect_to root_path, alert: "Failed to create learning path."
    end
  end
  
  def show
    #recommited
    @learning_path = current_user.learning_paths.find(params[:id])
    @milestones = Milestone.all
  end
end

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

  # GET
  def show
    # This finds the learning path by ID, that is if it belongs to the current user.
    # makes sure user A can't access user B learning paths.
    @learning_path = current_user.learning_paths.find(params[:id])
<<<<<<< HEAD

    # Collects all milestones per learning path and sort them by position.
    # Now the positions ensures each milestones are shown in the correct order.
    @milestones = @learning_path.milestones.order(:position)
=======
    @milestones = Milestone.all
>>>>>>> 45b64923b3e575c6b3e56116163c9d15095615c7
  end
end

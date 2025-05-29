class MilestonesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_learning_path
  before_action :set_milestone, only: [:show, :update]

  # GET /milestones/1
  def show
  end

  # PATCH /milestones/1
  def update
    # Update the milestone with new params
    if @milestone.update(milestone_params)
      # When successful, redirect back to the learning path
      redirect_to learning_path_path(@milestone.learning_path), notice: "Milestone marked as completed!"
    else
      # If not redirect back with an error message
      redirect_to learning_path_path(@milestone.learning_path), alert: "Failed to mark milestone as completed."
    end
  end

  private

  # Milestone loads based on ID from the URL
  def set_milestone
    @milestone = Milestone.find(params[:id])
    # Ensure the milestone is part of a learning path owned by the current user
    unless @milestone.learning_path.user == current_user
      redirect_to root_path, alert: "You don't have permission to edit this milestone."
    end
  end

  # Allows only the `completed` params for updates
  def milestone_params
    params.require(:milestone).permit(:completed)
  end
end

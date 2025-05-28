class MilestonesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_learning_path
  before_action :set_milestone, only: [:show, :update]

  def show
  end

  def update
    if @milestone.update(milestone_params)
      redirect_to learning_path_path(@milestone.learning_path), notice: "Milestone marked as completed!"
    else
      redirect_to learning_path_path(@milestone.learning_path), alert: "Failed to mark milestone as completed."
    end
  end

  private

  def set_milestone
    @milestone = Milestone.find(params[:id])
    # Ensure the milestone belongs to a learning path owned by the current user
    unless @milestone.learning_path.user == current_user
      redirect_to root_path, alert: "You don't have permission to edit this milestone."
    end
  end

  def milestone_params
    params.require(:milestone).permit(:completed)
  end
end

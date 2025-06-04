class MilestonesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_learning_path, only: [:mark_complete]
  before_action :set_milestone, only: [:mark_complete]

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

  def mark_complete
    if @milestone.nil?
      flash[:alert] = "Milestone not found."
      redirect_to root_path
      return
    end

    if @milestone.update(milestone_params)
      redirect_to learning_path_path(@learning_path), notice: "Milestone completed!"
    else
      redirect_to :back, alert: "Failed to complete milestone."
    end
  end

  private

  def set_milestone
    @milestone = Milestone.find_by(id: params[:id])
    # Optional: Add logging for debugging
    # Rails.logger.debug "Milestone: #{@milestone.inspect}"
  end

  def set_learning_path
    @learning_path = @milestone&.learning_path
    # Optional: Add logging for debugging
    # Rails.logger.debug "Learning Path: #{@learning_path.inspect}"
  end

  def milestone_params
    params.require(:milestone).permit(:completed)
  end
end

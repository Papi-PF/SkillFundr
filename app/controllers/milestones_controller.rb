class MilestonesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_learning_path
  before_action :set_milestone, only: [:show, :update]

  def show
  end

  def update
    if @milestone.update(milestone_params)
      redirect_to learning_path_path(@learning_path), notice: "Milestone marked as completed!"
    else
      redirect_to learning_path_path(@learning_path), alert: "Failed to mark milestone as completed."
    end
  end

  private

  def set_learning_path
    @learning_path = current_user.learning_paths.find(params[:learning_path_id])
  end

  def set_milestone
    @milestone = @learning_path.milestones.find(params[:id])
  end

  def milestone_params
    params.require(:milestone).permit(:completed)
  end
end

class LearningPathsController < ApplicationController
  before_action :authenticate_user!

  def create
    @learning_path = current_user.learning_paths.new(skill_id: params[:skill_id])
    if @learning_path.save
      redirect_to learning_path_path(@learning_path), notice: "Your learning path has been created!"
    else
      redirect_to root_path, alert: "Failed to create learning path."
    end
  end

  def show
    @learning_path = current_user.learning_paths.find(params[:id])
    @milestones = @learning_path.milestones.order(:position)
  end
end

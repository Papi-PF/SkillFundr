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
      redirect_to dashboard_path, notice: "Started learning #{@learning_path.skill.name}!"
    else
      # If not redict back to home
      redirect_to root_path, alert: "Failed to create learning path."
    end
  end

  def show
    # Find the learning path by ID, ensuring it belongs to the current user
    @learning_path = current_user.learning_paths.find(params[:id])

    if @learning_path.nil?
      redirect_to dashboard_path, alert: "You don't have access to this learning path."
      return
    end

    # Get all milestones for this learning path and sort them by position
    @milestones = @learning_path.milestones.order(:position)

    # @learning_path = LearningPath.find(params[:id])
    # @milestones = @learning_path.milestones
  end

  def create_from_skill
    skill_id = params[:skill_id]
    current_user.learning_paths.create(skill_id: skill_id)
    redirect_to dashboard_path, notice: "Continuing your learning on this skill"
  end

  def destroy
    @learning_path = current_user.learning_paths.find(params[:id])
    @learning_path.destroy
    redirect_to dashboard_path, notice: "Learning path deleted successfully!"
  end
end

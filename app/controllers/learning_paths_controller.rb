class LearningPathsController < ApplicationController
  before_action :authenticate_user!

  # POST /learning_paths/1
  def create
    skill = Skill.find(params[:skill_id])
    learning_path = AiRoadmapGenerator.new(current_user, skill).generate_roadmap

    if learning_path.persisted? && learning_path.id.present?
      redirect_to learning_path_path(learning_path),
                  notice: "Your learning path is ready!"
    else
      # Handle failure (e.g., log errors or show a flash message)
      flash[:alert] = "Failed to generate your learning path."
      redirect_to root_path
    end
  end

  def show
    @learning_path = LearningPath.find(params[:id])
    @milestones = @learning_path.milestones.order(position: :asc)

    if @milestones.any?
      @completed_count = @milestones.where(completed: true).count
      @completion_percentage = (@completed_count.to_f / @milestones.count) * 100
    end
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

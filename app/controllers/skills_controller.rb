class SkillsController < ApplicationController
  def index
    @skills = Skill.all
  end

  def show
    @skill = Skill.find(params[:id])
    @learning_path = current_user.learning_paths.find_by(skill_id: @skill.id)
  end
end

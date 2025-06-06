class SkillsController < ApplicationController
  before_action :authenticate_user!

  # GET /skills
  def index
    # Will fetch all skills that are available and display in a list
    @skills = Skill.all
    @selected_skill = Skill.first
  end

  # GET /skills/1
  def show
    @skills = Skill.all
    @skill = Skill.find(params[:id])
    # look for the skills based on ID via url
    @milestones = @skill.milestones.order(:position)
  rescue ActiveRecord::RecordNotFound
    redirect_to skills_path, alert: "Course not found. Please select from available courses."
  end
end

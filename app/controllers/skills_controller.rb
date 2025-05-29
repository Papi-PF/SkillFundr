class SkillsController < ApplicationController
  before_action :authenticate_user!

  # GET /skills
  def index
    # Will fetch all skills that are available and display in a list
    @skills = Skill.all
  end

  # GET /skills/1
  def show
    # look for the skills based on ID via url
    @skill = Skill.find(params[:id])
  end
end

class SkillsController < ApplicationController
  def index
    @skills = Skill.all
  end

  def show
    @skills = Skill.all
    @skill = Skill.find(params[:id])
  end
end

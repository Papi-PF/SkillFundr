class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:landing, :home]

  def landing
    redirect_to home_path if user_signed_in?
  end

  def home
    @featured_skills = Skill.limit(6) # Always show first 6 real skills
  rescue => e
    Rails.logger.error "Error loading skills: #{e.message}"
    @featured_skills = [] # Fallback to empty array
  end

  def dashboard
    @learning_paths = current_user.learning_paths.includes(:skill, :milestones).distinct
  end
end

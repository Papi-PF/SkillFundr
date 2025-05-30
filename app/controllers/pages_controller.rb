class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  # GET /
  def home
    # Homepage
     @featured_skills = Skill.all.limit(6)  # Temporary solution
  rescue
    @featured_skills = []
  end

  # GET /dashboard
  def dashboard
    # Show's learning path of current user
    @learning_paths = current_user.learning_paths
  end
end

class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  # GET /
  def home
    # Homepage
  end

  # GET /dashboard
  def dashboard
    # Show's learning path of current user
    @learning_paths = current_user.learning_paths
  end
end

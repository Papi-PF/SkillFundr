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

  #  private

  # def default_courses
  #   [
  #     {
  #       name: "Full-stack Web Development",
  #       description: "Learn both front-end and back-end development to build complete web applications.",
  #       difficulty: "intermediate",
  #       is_default: true
  #     },
  #     {
  #       name: "Data Science Fundamentals",
  #       description: "Master Python, SQL, and machine learning to analyze and interpret complex data.",
  #       difficulty: "beginner",
  #       is_default: true
  #     },
  #     {
  #       name: "Mobile App Development",
  #       description: "Build native and cross-platform mobile applications for iOS and Android.",
  #       difficulty: "intermediate",
  #       is_default: true
  #     },
  #     {
  #       name: "UX/UI Design",
  #       description: "Learn user experience and interface design principles for modern applications.",
  #       difficulty: "beginner",
  #       is_default: true
  #     },
  #     {
  #       name: "DevOps Engineering",
  #       description: "Master deployment, CI/CD pipelines, and cloud infrastructure management.",
  #       difficulty: "advanced",
  #       is_default: true
  #     },
  #     {
  #       name: "Digital Marketing",
  #       description: "Learn SEO, content marketing, and social media strategies for business growth.",
  #       difficulty: "beginner",
  #       is_default: true
  #     }
  #   ]
  # end
end

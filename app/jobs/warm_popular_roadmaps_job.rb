class WarmPopularRoadmapsJob < ApplicationJob
  queue_as :default

  def perform
    # Fetch popular skills (define your popularity criteria)
    popular_skills = Skill.popular

    popular_skills = Skill.joins(:learning_paths)
                          .group('skills.id')
                          .order('COUNT(learning_paths.id) DESC')
                          .limit(5) # Top 5 popular skills

    User.find_each do |user|
      popular_skills.each do |skill|
        # Only generate if user doesn't already have a path for this skill
        unless user.learning_paths.exists?(skill_id: skill.id)
          AiRoadmapGenerator.new(user, skill).generate_roadmap
          sleep(delay)
        end
      end
    end
  end
end

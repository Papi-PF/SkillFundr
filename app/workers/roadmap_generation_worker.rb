class RoadmapGenerationWorker
  include Sidekiq::Worker

  def perform(learning_path_id)
    learning_path = LearningPath.find(learning_path_id)
    roadmap = AiRoadmapService.generate(learning_path.skill, learning_path.user)

    RoadmapGenerationService.create_milestones(learning_path, roadmap)
  end

  def self.create_milestones(learning_path, roadmap)
    roadmap.each_with_index do |milestone, index|
      learning_path.milestones.create!(
        title: milestone[:title],
        description: milestone[:description],
        position: index + 1,
        objectives: milestone[:objectives] || [],
        completed: false
      )
    end
  end
end

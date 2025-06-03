class RoadmapGenerationService
  def self.create_milestones(learning_path, roadmap)
    roadmap.each_with_index do |milestone, index|
      learning_path.milestones.create!(
        title: milestone[:title],
        description: milestone[:description],
        position: index + 1,
        objectives: milestone[:objectives] || []
      )
    end
  end
end

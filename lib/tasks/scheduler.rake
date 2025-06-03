namespace :scheduler do
  desc "Warm cache for popular roadmaps"
  task warm_roadmaps: :environment do
    WarmPopularRoadmapsJob.perform_later
    puts "Enqueued roadmap warming job"
  end
end

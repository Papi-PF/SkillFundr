class AiRoadmapGenerator
  def initialize(user, skill)
    @user = user
    @skill = skill
  end

  def generate_roadmap
    # Check cache first
    cached = Rails.cache.read(cache_key)
    return cached.learning_path if cached.is_a?(Hash) && cached[:learning_path].present?

    # Call OpenAI API
    client = OpenAI::Client.new
    response = client.chat(
      parameters: {
        model: "gpt-3.5-turbo",
        messages: [
          { role: "system", content: system_prompt },
          { role: "user", content: user_prompt }
        ],
        temperature: 0.7,
        max_tokens: 1000
      }
    )

    roadmap_data = parse_response(response)
    learning_path = save_roadmap(roadmap_data)

    # Cache both the data and the learning path ID
    Rails.cache.write(cache_key, {
      roadmap: roadmap_data,
      learning_path_id: learning_path.id
    }, expires_in: 1.week)

    learning_path # ✅ Return the LearningPath object
  end

  private

  def system_prompt
    <<~PROMPT
      You are an expert learning path advisor. Create a personalized 3-month roadmap for #{@user.name} to learn #{@skill.name}.
      Structure response as JSON:
      {
        "roadmap": [
          {
            "title": "Milestone title",
            "description": "1-2 sentence description",
            "estimated_days": 5,
            "resources": [
              {"type": "article", "title": "...", "url": "..."},
              {"type": "video", "title": "...", "url": "..."}
            ]
          }
        ]
      }
      Include 5-8 milestones. Estimated total duration: 90 days.
    PROMPT
  end

  def user_prompt
    background = @user.learning_style.presence || 'No specific preferences'

    <<~PROMPT
      User background: #{background}
      Skill level: Beginner
      Learning goals: Master fundamentals of #{@skill.name}
      Preferred resources: Articles and videos
    PROMPT
  end

  def parse_response(response)
    json_string = response.dig("choices", 0, "message", "content")
    JSON.parse(json_string)
  end

  def save_roadmap(data)
    # Find or create the learning path
    learning_path = @user.learning_paths.find_or_initialize_by(skill: @skill)
    learning_path.ai_generated = true
    learning_path.save! if learning_path.new_record?

    # Only create milestones if it's a new path or they don't exist
    if learning_path.milestones.empty?
      data["roadmap"].each_with_index do |milestone, index|
        learning_path.milestones.create!(
          title: milestone["title"],
          description: milestone["description"],
          position: index + 1,
          estimated_days: milestone["estimated_days"],
          metadata: milestone["resources"].to_json # ✅ Store as JSON string
        )
      end
    end

    learning_path
  end

  def cache_key
    "user_#{@user.id}_skill_#{@skill.id}_roadmap_v1"
  end
end

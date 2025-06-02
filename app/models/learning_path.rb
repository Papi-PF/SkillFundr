class LearningPath < ApplicationRecord
  # Learning path belongs to a user and a skill
  belongs_to :user
  belongs_to :skill

  # Learning path has many milestones
  has_many :milestones, dependent: :destroy

  # makes sure both user and skill are present when learning path is created
  validates :user, presence: true
  validates :skill, presence: true
  validates :skill_id, uniqueness: { scope: :user_id }

  def content
    client = OpenAI::Client.new
    chatgpt_response = client.chat(parameters: {
        model:"gpt-3.5-turbo",
        messages: [{ role: "user", content: "Give me a the step by step learning path of how to learn Javascript." } ]
      })
    return chatgpt_response["choices"][0]["message"]["content"]
  end
end

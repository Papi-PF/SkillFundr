# app/helpers/pages_helper.rb
module PagesHelper
  def default_courses
    [
      {
        id: 1,
        name: "Full-stack Web Development",
        description: "Learn both front-end and back-end development to become a full-stack developer.",
        difficulty: "intermediate",
        persisted?: false
      },
      {
        id: 2,
        name: "Data Science",
        description: "Master Python, SQL, and machine learning to analyze and interpret complex data.",
        difficulty: "beginner",
        persisted?: false
      },
      {
        id: 3,
        name: "Mobile App Development",
        description: "Build native and cross-platform mobile applications for iOS and Android.",
        difficulty: "intermediate",
        persisted?: false
      },
      {
        id: 4,
        name: "Web Performance Optimization",
        description: "Techniques for faster web experiences",
        difficulty: "advanced",
        persisted?: false
      },
      {
        id: 5,
        name: "DevOps Fundamentals",
        description: "Practices combining software development and IT operations",
        difficulty: "intermediate",
        persisted?: false
      },
      {
        id: 6,
        name: "Docker for Developers",
        description: "Containerization technology for applications",
        difficulty: "intermediate",
        persisted?: false
      }
    ]
  end
end

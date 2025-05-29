# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Clear existing data to start fresh
# Destroy in reverse order of dependency to avoid foreign key errors

# Mocked AI function to generate learning path milestones
def ai_generate_milestones(skill_name)
  case skill_name
  when "Full-stack Web Development"
    [
      { title: "Learn HTML & CSS", description: "Build basic web pages using HTML and style them with CSS." },
      { title: "JavaScript Fundamentals", description: "Understand variables, functions, and DOM manipulation in JavaScript." },
      { title: "Intro to Ruby on Rails", description: "Create a simple blog application using Ruby on Rails." },
      { title: "React Basics", description: "Build interactive UI components using React.js." },
      { title: "Deploy Your App", description: "Deploy your final project to Heroku or Render." }
    ]
  when "Data Science"
    [
      { title: "Python Basics", description: "Install and run Python. Learn about variables, loops, and conditionals." },
      { title: "Pandas & NumPy", description: "Use Pandas and NumPy to clean and manipulate data." },
      { title: "Visualization with Matplotlib/Seaborn", description: "Plot charts and graphs to visualize data insights." },
      { title: "Machine Learning Introduction", description: "Learn the basics of supervised and unsupervised learning." },
      { title: "Build a Data Model", description: "Train and evaluate a model using scikit-learn." }
    ]
  when "Mobile App Development"
    [
      { title: "Learn Swift/Kotlin", description: "Get started with either Swift (iOS) or Kotlin (Android)." },
      { title: "UI Components", description: "Build layouts and use buttons, text fields, and views." },
      { title: "Navigation & Routing", description: "Move between screens and pass data." },
      { title: "API Integration", description: "Fetch and display data from external APIs." },
      { title: "App Deployment", description: "Package and publish your app to Google Play or the App Store." }
    ]
  when "UX/UI Design"
    [
      { title: "Design Principles", description: "Understand typography, spacing, and color theory." },
      { title: "Wireframing", description: "Sketch out page layouts and user flows." },
      { title: "Prototyping", description: "Create clickable prototypes with Figma or Adobe XD." },
      { title: "User Testing", description: "Gather feedback from real users to improve design." },
      { title: "Final Portfolio Piece", description: "Create a polished design to showcase in your portfolio." }
    ]
  else
    [
      { title: "Introduction to #{skill_name}", description: "Start with the fundamentals of #{skill_name}." },
      { title: "Core Concepts", description: "Dive into key concepts and tools used in #{skill_name}." },
      { title: "Project Practice", description: "Apply what you've learned with hands-on projects." },
      { title: "Advanced Topics", description: "Explore advanced techniques and best practices." },
      { title: "Capstone Project", description: "Build a final project to demonstrate mastery." }
    ]
  end
end

Milestone.destroy_all
LearningPath.destroy_all
Skill.destroy_all
User.destroy_all

puts "Old data cleared successfully!"

# Sample users
users_data = [
  { email: "alexis@yahoo.com", password: "password", name: "Alexis" },
  { email: "yu@example.com", password: "password", name: "Yu" },
  { email: "annie@dev.com", password: "password", name: "Annie" }
]

users = users_data.map do |attrs|
  user = User.create!(attrs)
  puts "User created: #{user.name} (#{user.email})"
  user
end

puts "\nSkills being added...\n"

# Skills that a user can choose from
skills = [
  {
    name: "Full-stack Web Development",
    description: "Learn both front-end and back-end development to become a full-stack developer."
  },
  {
    name: "Data Science",
    description: "Master Python, SQL, and machine learning to analyze and interpret complex data."
  },
  {
    name: "Mobile App Development",
    description: "Build native and cross-platform mobile applications for iOS and Android."
  },
  {
    name: "UX/UI Design",
    description: "Design intuitive and visually appealing user interfaces and experiences."
  }
]

skills.each do |skill_attrs|
  skill = Skill.create!(skill_attrs)
  puts "Skill created: #{skill.name}"
end

puts "\nLearning Paths and Milestones are now being generated as if by an AI mentor...\n"

# Simulate AI-generated learning paths for each user
users.each_with_index do |user, index|
  skill = Skill.offset(rand(Skill.count)).first || Skill.first
  puts "#{user.name} is starting a learning path in '#{skill.name}'..."

  # Creates a new learning path
  learning_path = LearningPath.create!(
    user: user,
    skill: skill
  )
  puts "Learning Path created for #{user.name}: #{learning_path.skill.name}"

  # Generate AI-simulated milestones
  milestones_data = ai_generate_milestones(skill.name)

  # Assign positions and create milestones
  milestones_data.each_with_index do |milestone_attrs, i|
    position = i + 1
    milestone = Milestone.create!(
      title: milestone_attrs[:title],
      description: milestone_attrs[:description],
      position: position,
      learning_path: learning_path,
      completed: rand(0..1) == 1 ? true : false # Randomly mark some as complete
    )
    puts "Milestone created: #{milestone.title} (Position #{position}, Completed: #{milestone.completed ? '✅' : '❌'})"
  end
end

puts "\nSeed data created successfully!"

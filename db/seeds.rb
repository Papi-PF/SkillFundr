# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

User.destroy_all
Skill.destroy_all
LearningPath.destroy_all
Milestone.destroy_all

user = User.create!(
  email: "alexis@yahoo.com",
  password: "password",
)

full_stack_skill = Skill.create!(
  name: "Full-stack Web Development",
  description: "Learn both front-end and back-end development to become a full-stack developer."
)

data_science_skill = Skill.create!(
  name: "Data Science",
  description: "Master Python, SQL, and machine learning to analyze and interpret complex data."
)

learning_path = LearningPath.create!(
  user: user,
  skill: full_stack_skill
)

[
  { title: "Learn HTML & CSS", description: "Build basic web pages using HTML and style them with CSS." },
  { title: "JavaScript Fundamentals", description: "Understand variables, functions, and DOM manipulation in JavaScript." },
  { title: "Intro to Ruby on Rails", description: "Create a simple blog application using Ruby on Rails." },
  { title: "React Basics", description: "Build interactive UI components using React.js." },
  { title: "Deploy Your App", description: "Deploy your final project to Heroku or Render." }
].each_with_index do |attrs, index|
  Milestone.create!(
    title: attrs[:title],
    description: attrs[:description],
    position: index + 1,
    learning_path: learning_path
  )
end

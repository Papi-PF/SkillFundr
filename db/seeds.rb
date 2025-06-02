# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Milestone generator based on skill name
puts "Cleaning database..."
User.destroy_all
Skill.destroy_all
LearningPath.destroy_all
Milestone.destroy_all

# Create skills WITH descriptions
skills = [
  { name: "JavaScript Fundamentals", description: "Core concepts of JavaScript programming language" },
  { name: "React Development", description: "Building user interfaces with React library" },
  { name: "Python Programming", description: "Fundamentals of Python language and applications" },
  { name: "Node.js Development", description: "Server-side JavaScript runtime environment" },
  { name: "TypeScript Mastery", description: "Static typing for JavaScript development" },
  { name: "Full-stack Web Development", description: "End-to-end web application development" },
  { name: "API Design and Development", description: "Creating robust application programming interfaces" },
  { name: "GraphQL Fundamentals", description: "Query language for APIs" },
  { name: "Web Performance Optimization", description: "Techniques for faster web experiences" },
  { name: "DevOps Fundamentals", description: "Practices combining software development and IT operations" },
  { name: "Docker for Developers", description: "Containerization technology for applications" },
  { name: "Cloud Computing with AWS", description: "Amazon Web Services cloud platform" },
  { name: "Data Science", description: "Extracting insights from structured/unstructured data" },
  { name: "Database Design and Optimization", description: "Structuring and tuning database systems" },
  { name: "Mobile App Development", description: "Creating applications for mobile devices" },
  { name: "UX/UI Design", description: "User experience and interface design principles" },
  { name: "UI/UX Design Principles", description: "Foundational rules for effective design" },
  { name: "System Design for Web Applications", description: "Architecting scalable web systems" },
  { name: "Cybersecurity for Developers", description: "Security practices in software development" },
  { name: "Testing and Debugging", description: "Quality assurance and error resolution techniques" },
  { name: "Agile and Project Management", description: "Iterative development methodologies" }
]

skills.each { |skill| Skill.create!(skill) }

puts "Created #{Skill.count} skills with descriptions"

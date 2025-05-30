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
def generate_milestones(skill_name)
  case skill_name
  when "JavaScript Fundamentals"
    [
      { title: "Variables & Data Types", description: "Master let, const, and JavaScript data types" },
      { title: "Functions & Scope", description: "Understand function declarations and scope chain" },
      { title: "DOM Manipulation", description: "Select and manipulate page elements" },
      { title: "Event Handling", description: "Respond to user interactions" },
      { title: "ES6+ Features", description: "Master arrow functions, templates, and destructuring" }
    ]
  when "React Development"
    [
      { title: "Components & JSX", description: "Create functional components with JSX" },
      { title: "Props & State", description: "Manage component data and state" },
      { title: "Hooks", description: "Use useState, useEffect and custom hooks" },
      { title: "React Router", description: "Implement client-side routing" },
      { title: "State Management", description: "Manage global state with Context API" }
    ]
  when "Python Programming"
    [
      { title: "Python Syntax", description: "Master Python syntax and basic constructs" },
      { title: "Data Structures", description: "Work with lists, tuples, and dictionaries" },
      { title: "Functions & Modules", description: "Create reusable code components" },
      { title: "OOP Concepts", description: "Implement classes and inheritance" },
      { title: "Popular Libraries", description: "Explore NumPy, Pandas, and Requests" }
    ]
  when "Node.js Development"
    [
      { title: "Node Fundamentals", description: "Understand event loop and core modules" },
      { title: "Express Framework", description: "Build REST APIs with Express.js" },
      { title: "Middleware", description: "Implement request processing pipeline" },
      { title: "Database Integration", description: "Connect to MongoDB or PostgreSQL" },
      { title: "Authentication", description: "Implement JWT authentication" }
    ]
  when "TypeScript Mastery"
    [
      { title: "Basic Types", description: "Work with primitives and arrays" },
      { title: "Interfaces & Types", description: "Define custom types" },
      { title: "Generics", description: "Implement reusable type logic" },
      { title: "Decorators", description: "Use decorators for meta-programming" },
      { title: "TS with Frameworks", description: "Integrate with React or Angular" }
    ]
  when "Full-stack Web Development"
    [
      { title: "HTML & CSS", description: "Build responsive web layouts" },
      { title: "JavaScript Fundamentals", description: "Add interactivity to web pages" },
      { title: "Backend Development", description: "Create REST APIs with Node.js or Rails" },
      { title: "Database Integration", description: "Connect frontend to database" },
      { title: "Deployment", description: "Deploy full-stack application" }
    ]
  when "API Design and Development"
    [
      { title: "REST Principles", description: "Design resourceful endpoints" },
      { title: "HTTP Methods", description: "Implement GET, POST, PUT, DELETE" },
      { title: "Authentication", description: "Secure APIs with JWT or OAuth" },
      { title: "Error Handling", description: "Create consistent error responses" },
      { title: "API Documentation", description: "Document with Swagger/OpenAPI" }
    ]
  when "GraphQL Fundamentals"
    [
      { title: "Schemas & Types", description: "Define GraphQL schemas" },
      { title: "Queries & Mutations", description: "Fetch and update data" },
      { title: "Resolvers", description: "Implement data fetching logic" },
      { title: "Authentication", description: "Secure GraphQL APIs" },
      { title: "Subscriptions", description: "Implement real-time updates" }
    ]
  when "Web Performance Optimization"
    [
      { title: "Performance Metrics", description: "Measure Core Web Vitals" },
      { title: "Asset Optimization", description: "Minify and compress resources" },
      { title: "Lazy Loading", description: "Load resources on demand" },
      { title: "Caching Strategies", description: "Implement browser and CDN caching" },
      { title: "Performance Audit", description: "Analyze and optimize a website" }
    ]
  when "DevOps Fundamentals"
    [
      { title: "CI/CD Concepts", description: "Set up automated pipelines" },
      { title: "Docker Basics", description: "Containerize applications" },
      { title: "Kubernetes", description: "Orchestrate containers" },
      { title: "Infrastructure as Code", description: "Use Terraform or CloudFormation" },
      { title: "Monitoring & Logging", description: "Implement observability" }
    ]
  when "Docker for Developers"
    [
      { title: "Containers vs VMs", description: "Understand container technology" },
      { title: "Dockerfile Creation", description: "Build efficient Docker images" },
      { title: "Docker Compose", description: "Manage multi-container apps" },
      { title: "Networking & Volumes", description: "Configure container communication" },
      { title: "Container Orchestration", description: "Introduction to Kubernetes" }
    ]
  when "Cloud Computing with AWS"
    [
      { title: "IAM & Security", description: "Manage access controls" },
      { title: "EC2 & S3", description: "Launch instances and manage storage" },
      { title: "RDS & DynamoDB", description: "Work with database services" },
      { title: "Lambda Functions", description: "Create serverless applications" },
      { title: "Deploy to AWS", description: "Deploy a full application" }
    ]
  when "Data Science"
    [
      { title: "Python for Data", description: "Use Pandas for data manipulation" },
      { title: "Data Cleaning", description: "Handle missing values and outliers" },
      { title: "Exploratory Analysis", description: "Perform EDA with visualization" },
      { title: "Machine Learning", description: "Implement regression models" },
      { title: "Data Science Project", description: "Complete end-to-end project" }
    ]
  when "Database Design and Optimization"
    [
      { title: "Relational Theory", description: "Understand normalization principles" },
      { title: "SQL Mastery", description: "Write complex SQL queries" },
      { title: "Indexing Strategies", description: "Optimize query performance" },
      { title: "NoSQL Concepts", description: "Work with document databases" },
      { title: "Database Scaling", description: "Implement replication and sharding" }
    ]
  when "Mobile App Development"
    [
      { title: "Platform Choice", description: "Select iOS, Android or cross-platform" },
      { title: "UI Development", description: "Build responsive mobile interfaces" },
      { title: "Navigation", description: "Implement app navigation patterns" },
      { title: "Device APIs", description: "Access camera and geolocation" },
      { title: "App Deployment", description: "Publish to app stores" }
    ]
  when "UX/UI Design"
    [
      { title: "Design Principles", description: "Master layout, color, and typography" },
      { title: "User Research", description: "Conduct interviews and create personas" },
      { title: "Wireframing", description: "Create low-fidelity layouts" },
      { title: "Prototyping", description: "Build interactive prototypes" },
      { title: "Usability Testing", description: "Validate designs with users" }
    ]
  when "UI/UX Design Principles"
    [
      { title: "Visual Hierarchy", description: "Create clear information structure" },
      { title: "Interaction Design", description: "Design intuitive user flows" },
      { title: "Accessibility", description: "Ensure designs meet WCAG standards" },
      { title: "Design Systems", description: "Create consistent UI components" },
      { title: "Design Portfolio", description: "Showcase your work" }
    ]
  when "System Design for Web Applications"
    [
      { title: "Architecture Patterns", description: "Compare monoliths vs microservices" },
      { title: "Scalability", description: "Design horizontal scaling solutions" },
      { title: "Database Scaling", description: "Implement sharding and replication" },
      { title: "Caching Strategies", description: "Use Redis or Memcached" },
      { title: "Load Balancing", description: "Distribute traffic efficiently" }
    ]
  when "Cybersecurity for Developers"
    [
      { title: "OWASP Top 10", description: "Prevent common vulnerabilities" },
      { title: "Authentication", description: "Implement secure password storage" },
      { title: "Encryption", description: "Secure data at rest and in transit" },
      { title: "Input Validation", description: "Sanitize user input" },
      { title: "Security Headers", description: "Configure CSP and other headers" }
    ]
  when "Testing and Debugging"
    [
      { title: "Testing Pyramid", description: "Implement unit, integration, and E2E tests" },
      { title: "Testing Frameworks", description: "Use Jest, RSpec or PyTest" },
      { title: "Debugging Techniques", description: "Identify and fix issues systematically" },
      { title: "Test Coverage", description: "Measure and improve test coverage" },
      { title: "CI/CD Testing", description: "Integrate tests into pipelines" }
    ]
  when "Agile and Project Management"
    [
      { title: "Agile Manifesto", description: "Understand Agile principles" },
      { title: "Scrum Framework", description: "Implement sprints and ceremonies" },
      { title: "Kanban Method", description: "Visualize workflow with Kanban" },
      { title: "User Stories", description: "Create effective user stories" },
      { title: "Project Tracking", description: "Use Jira or Trello" }
    ]
  else
    [
      { title: "Introduction", description: "Get started with #{skill_name}" },
      { title: "Core Concepts", description: "Learn fundamental principles" },
      { title: "Practical Application", description: "Apply concepts in projects" },
      { title: "Advanced Topics", description: "Explore advanced techniques and best practices" },
      { title: "Capstone Project", description: "Build a final project to demonstrate mastery" }
    ]
  end
end

puts "Cleaning database..."
User.destroy_all
Skill.destroy_all
LearningPath.destroy_all
Milestone.destroy_all

# Create test users
users_data = [
  { email: "alexis@yahoo.com", password: "password" },
  { email: "yu@example.com", password: "password" },
  { email: "annie@dev.com", password: "password" }
]

users = users_data.map do |attrs|
  user = User.create!(attrs)
  puts "👤 Created user: #{user.email}"
  user
end

# Milestone generator based on skill name
def generate_milestones(skill_name)
  case skill_name
  when "JavaScript Fundamentals"
    [
      { title: "Variables & Data Types", description: "Master let, const, and JavaScript data types" },
      { title: "Functions & Scope", description: "Understand function declarations and scope chain" },
      { title: "DOM Manipulation", description: "Select and manipulate page elements" },
      { title: "Event Handling", description: "Respond to user interactions" },
      { title: "ES6+ Features", description: "Master arrow functions, templates, and destructuring" }
    ]
  when "React Development"
    [
      { title: "Components & JSX", description: "Create functional components with JSX" },
      { title: "Props & State", description: "Manage component data and state" },
      { title: "Hooks", description: "Use useState, useEffect and custom hooks" },
      { title: "React Router", description: "Implement client-side routing" },
      { title: "State Management", description: "Manage global state with Context API" }
    ]
  when "Python Programming"
    [
      { title: "Python Syntax", description: "Master Python syntax and basic constructs" },
      { title: "Data Structures", description: "Work with lists, tuples, and dictionaries" },
      { title: "Functions & Modules", description: "Create reusable code components" },
      { title: "OOP Concepts", description: "Implement classes and inheritance" },
      { title: "Popular Libraries", description: "Explore NumPy, Pandas, and Requests" }
    ]
  when "Node.js Development"
    [
      { title: "Node Fundamentals", description: "Understand event loop and core modules" },
      { title: "Express Framework", description: "Build REST APIs with Express.js" },
      { title: "Middleware", description: "Implement request processing pipeline" },
      { title: "Database Integration", description: "Connect to MongoDB or PostgreSQL" },
      { title: "Authentication", description: "Implement JWT authentication" }
    ]
  when "TypeScript Mastery"
    [
      { title: "Basic Types", description: "Work with primitives and arrays" },
      { title: "Interfaces & Types", description: "Define custom types" },
      { title: "Generics", description: "Implement reusable type logic" },
      { title: "Decorators", description: "Use decorators for meta-programming" },
      { title: "TS with Frameworks", description: "Integrate with React or Angular" }
    ]
  when "Full-stack Web Development"
    [
      { title: "HTML & CSS", description: "Build responsive web layouts" },
      { title: "JavaScript Fundamentals", description: "Add interactivity to web pages" },
      { title: "Backend Development", description: "Create REST APIs with Node.js or Rails" },
      { title: "Database Integration", description: "Connect frontend to database" },
      { title: "Deployment", description: "Deploy full-stack application" }
    ]
  when "API Design and Development"
    [
      { title: "REST Principles", description: "Design resourceful endpoints" },
      { title: "HTTP Methods", description: "Implement GET, POST, PUT, DELETE" },
      { title: "Authentication", description: "Secure APIs with JWT or OAuth" },
      { title: "Error Handling", description: "Create consistent error responses" },
      { title: "API Documentation", description: "Document with Swagger/OpenAPI" }
    ]
  when "GraphQL Fundamentals"
    [
      { title: "Schemas & Types", description: "Define GraphQL schemas" },
      { title: "Queries & Mutations", description: "Fetch and update data" },
      { title: "Resolvers", description: "Implement data fetching logic" },
      { title: "Authentication", description: "Secure GraphQL APIs" },
      { title: "Subscriptions", description: "Implement real-time updates" }
    ]
  when "Web Performance Optimization"
    [
      { title: "Performance Metrics", description: "Measure Core Web Vitals" },
      { title: "Asset Optimization", description: "Minify and compress resources" },
      { title: "Lazy Loading", description: "Load resources on demand" },
      { title: "Caching Strategies", description: "Implement browser and CDN caching" },
      { title: "Performance Audit", description: "Analyze and optimize a website" }
    ]
  when "DevOps Fundamentals"
    [
      { title: "CI/CD Concepts", description: "Set up automated pipelines" },
      { title: "Docker Basics", description: "Containerize applications" },
      { title: "Kubernetes", description: "Orchestrate containers" },
      { title: "Infrastructure as Code", description: "Use Terraform or CloudFormation" },
      { title: "Monitoring & Logging", description: "Implement observability" }
    ]
  when "Docker for Developers"
    [
      { title: "Containers vs VMs", description: "Understand container technology" },
      { title: "Dockerfile Creation", description: "Build efficient Docker images" },
      { title: "Docker Compose", description: "Manage multi-container apps" },
      { title: "Networking & Volumes", description: "Configure container communication" },
      { title: "Container Orchestration", description: "Introduction to Kubernetes" }
    ]
  when "Cloud Computing with AWS"
    [
      { title: "IAM & Security", description: "Manage access controls" },
      { title: "EC2 & S3", description: "Launch instances and manage storage" },
      { title: "RDS & DynamoDB", description: "Work with database services" },
      { title: "Lambda Functions", description: "Create serverless applications" },
      { title: "Deploy to AWS", description: "Deploy a full application" }
    ]
  when "Data Science"
    [
      { title: "Python for Data", description: "Use Pandas for data manipulation" },
      { title: "Data Cleaning", description: "Handle missing values and outliers" },
      { title: "Exploratory Analysis", description: "Perform EDA with visualization" },
      { title: "Machine Learning", description: "Implement regression models" },
      { title: "Data Science Project", description: "Complete end-to-end project" }
    ]
  when "Database Design and Optimization"
    [
      { title: "Relational Theory", description: "Understand normalization principles" },
      { title: "SQL Mastery", description: "Write complex SQL queries" },
      { title: "Indexing Strategies", description: "Optimize query performance" },
      { title: "NoSQL Concepts", description: "Work with document databases" },
      { title: "Database Scaling", description: "Implement replication and sharding" }
    ]
  when "Mobile App Development"
    [
      { title: "Platform Choice", description: "Select iOS, Android or cross-platform" },
      { title: "UI Development", description: "Build responsive mobile interfaces" },
      { title: "Navigation", description: "Implement app navigation patterns" },
      { title: "Device APIs", description: "Access camera and geolocation" },
      { title: "App Deployment", description: "Publish to app stores" }
    ]
  when "UX/UI Design"
    [
      { title: "Design Principles", description: "Master layout, color, and typography" },
      { title: "User Research", description: "Conduct interviews and create personas" },
      { title: "Wireframing", description: "Create low-fidelity layouts" },
      { title: "Prototyping", description: "Build interactive prototypes" },
      { title: "Usability Testing", description: "Validate designs with users" }
    ]
  when "UI/UX Design Principles"
    [
      { title: "Visual Hierarchy", description: "Create clear information structure" },
      { title: "Interaction Design", description: "Design intuitive user flows" },
      { title: "Accessibility", description: "Ensure designs meet WCAG standards" },
      { title: "Design Systems", description: "Create consistent UI components" },
      { title: "Design Portfolio", description: "Showcase your work" }
    ]
  when "System Design for Web Applications"
    [
      { title: "Architecture Patterns", description: "Compare monoliths vs microservices" },
      { title: "Scalability", description: "Design horizontal scaling solutions" },
      { title: "Database Scaling", description: "Implement sharding and replication" },
      { title: "Caching Strategies", description: "Use Redis or Memcached" },
      { title: "Load Balancing", description: "Distribute traffic efficiently" }
    ]
  when "Cybersecurity for Developers"
    [
      { title: "OWASP Top 10", description: "Prevent common vulnerabilities" },
      { title: "Authentication", description: "Implement secure password storage" },
      { title: "Encryption", description: "Secure data at rest and in transit" },
      { title: "Input Validation", description: "Sanitize user input" },
      { title: "Security Headers", description: "Configure CSP and other headers" }
    ]
  when "Testing and Debugging"
    [
      { title: "Testing Pyramid", description: "Implement unit, integration, and E2E tests" },
      { title: "Testing Frameworks", description: "Use Jest, RSpec or PyTest" },
      { title: "Debugging Techniques", description: "Identify and fix issues systematically" },
      { title: "Test Coverage", description: "Measure and improve test coverage" },
      { title: "CI/CD Testing", description: "Integrate tests into pipelines" }
    ]
  when "Agile and Project Management"
    [
      { title: "Agile Manifesto", description: "Understand Agile principles" },
      { title: "Scrum Framework", description: "Implement sprints and ceremonies" },
      { title: "Kanban Method", description: "Visualize workflow with Kanban" },
      { title: "User Stories", description: "Create effective user stories" },
      { title: "Project Tracking", description: "Use Jira or Trello" }
    ]
  else
    [
      { title: "Introduction", description: "Get started with #{skill_name}" },
      { title: "Core Concepts", description: "Learn fundamental principles" },
      { title: "Practical Application", description: "Apply concepts in projects" },
      { title: "Advanced Topics", description: "Explore advanced techniques and best practices" },
      { title: "Capstone Project", description: "Build a final project to demonstrate mastery" }
    ]
  end
end

# Define skills with detailed roadmaps
skills_data = [
  {
    name: "Full-stack Web Development",
    description: "Learn both front-end and back-end development to become a full-stack developer.",
    estimated_duration: "3 months",
    roadmap: <<~ROADMAP
      🔹 Phase 1 (2 weeks): Learn HTML & CSS
      🔹 Phase 2 (1 month): JavaScript Fundamentals
      🔹 Phase 3 (3 weeks): Intro to Ruby on Rails
      🔹 Phase 4 (2 weeks): React Basics
      🔹 Phase 5 (2 weeks): Deploy Your App
    ROADMAP
  },
  {
    name: "Data Science",
    description: "Master Python, SQL, and machine learning to analyze and interpret complex data.",
    estimated_duration: "4 months",
    roadmap: <<~ROADMAP
      🔹 Phase 1 (3 weeks): Python Basics
      🔹 Phase 2 (2 weeks): Pandas & NumPy
      🔹 Phase 3 (3 weeks): Visualization with Matplotlib/Seaborn
      🔹 Phase 4 (3 weeks): Machine Learning Introduction
      🔹 Phase 5 (3 weeks): Build a Data Model
    ROADMAP
  },
  {
    name: "Mobile App Development",
    description: "Build native and cross-platform mobile applications for iOS and Android.",
    estimated_duration: "3 months",
    roadmap: <<~ROADMAP
      🔹 Phase 1 (2 weeks): Learn Swift/Kotlin
      🔹 Phase 2 (2 weeks): UI Components
      🔹 Phase 3 (3 weeks): Navigation & Routing
      🔹 Phase 4 (2 weeks): API Integration
      🔹 Phase 5 (2 weeks): App Deployment
    ROADMAP
  },
  {
    name: "UX/UI Design",
    description: "Design intuitive and visually appealing user interfaces and experiences.",
    estimated_duration: "2 months",
    roadmap: <<~ROADMAP
      🔹 Phase 1 (2 weeks): Design Principles
      🔹 Phase 2 (2 weeks): Wireframing
      🔹 Phase 3 (3 weeks): Prototyping
      🔹 Phase 4 (2 weeks): User Testing
      🔹 Phase 5 (2 weeks): Final Portfolio Piece
    ROADMAP
  },
  {
    name: "JavaScript Fundamentals",
    description: "Master the core concepts of JavaScript.",
    estimated_duration: "2 months",
    roadmap: <<~ROADMAP
      🔹 Phase 1 (2 weeks): Variables & Data Types
      🔹 Phase 2 (3 weeks): Functions & Scope
      🔹 Phase 3 (2 weeks): DOM Manipulation
      🔹 Phase 4 (3 weeks): ES6+ Features
      🔹 Phase 5 (2 weeks): Asynchronous Programming
    ROADMAP
  },
  {
    name: "React Development",
    description: "Build modern user interfaces with React.",
    estimated_duration: "2.5 months",
    roadmap: <<~ROADMAP
      🔹 Phase 1 (2 weeks): JSX & Components
      🔹 Phase 2 (3 weeks): Props & State
      🔹 Phase 3 (2 weeks): React Router
      🔹 Phase 4 (3 weeks): Redux Toolkit
      🔹 Phase 5 (2 weeks): Testing React Apps
    ROADMAP
  },
  {
    name: "Python Programming",
    description: "Learn Python for web development and automation.",
    estimated_duration: "2 months",
    roadmap: <<~ROADMAP
      🔹 Phase 1 (3 weeks): Syntax & Data Types
      🔹 Phase 2 (2 weeks): Control Flow
      🔹 Phase 3 (3 weeks): Functions & Modules
      🔹 Phase 4 (2 weeks): Data Structures
      🔹 Phase 5 (2 weeks): Object-Oriented Python
    ROADMAP
  },
  {
    name: "DevOps Fundamentals",
    description: "Master the practices of DevOps.",
    estimated_duration: "3 months",
    roadmap: <<~ROADMAP
      🔹 Phase 1 (2 weeks): Git & GitHub
      🔹 Phase 2 (3 weeks): CI/CD Pipelines
      🔹 Phase 3 (3 weeks): Docker & Containerization
      🔹 Phase 4 (2 weeks): Cloud Infrastructure
      🔹 Phase 5 (2 weeks): Monitoring & Logging
    ROADMAP
  },
  {
    name: "Cybersecurity for Developers",
    description: "Secure applications from common threats.",
    estimated_duration: "2 months",
    roadmap: <<~ROADMAP
      🔹 Phase 1 (2 weeks): OWASP Top 10
      🔹 Phase 2 (3 weeks): Authentication Best Practices
      🔹 Phase 3 (2 weeks): Encryption Techniques
      🔹 Phase 4 (3 weeks): Secure Coding
      🔹 Phase 5 (2 weeks): Vulnerability Scanning
    ROADMAP
  },
  {
    name: "Node.js Development",
    description: "Build backend APIs with Node.js and Express.",
    estimated_duration: "2 months",
    roadmap: <<~ROADMAP
      🔹 Phase 1 (2 weeks): Node.js Basics
      🔹 Phase 2 (3 weeks): Express.js
      🔹 Phase 3 (2 weeks): MongoDB Integration
      🔹 Phase 4 (2 weeks): RESTful APIs
      🔹 Phase 5 (2 weeks): Authentication & Authorization
    ROADMAP
  },
  {
    name: "Docker for Developers",
    description: "Containerize your applications with Docker.",
    estimated_duration: "2 months",
    roadmap: <<~ROADMAP
      🔹 Phase 1 (2 weeks): Docker Basics
      🔹 Phase 2 (3 weeks): Dockerfile & Images
      🔹 Phase 3 (2 weeks): Docker Compose
      🔹 Phase 4 (2 weeks): Networking & Volumes
      🔹 Phase 5 (2 weeks): Kubernetes Overview
    ROADMAP
  },
  {
    name: "GraphQL Fundamentals",
    description: "Build efficient APIs using GraphQL.",
    estimated_duration: "2 months",
    roadmap: <<~ROADMAP
      🔹 Phase 1 (2 weeks): Schema Definition
      🔹 Phase 2 (3 weeks): Queries & Mutations
      🔹 Phase 3 (2 weeks): Resolvers
      🔹 Phase 4 (2 weeks): Subscriptions
      🔹 Phase 5 (2 weeks): Integrating with Frontend
    ROADMAP
  },
  {
    name: "TypeScript Mastery",
    description: "Build type-safe applications with TypeScript.",
    estimated_duration: "2 months",
    roadmap: <<~ROADMAP
      🔹 Phase 1 (2 weeks): Types & Interfaces
      🔹 Phase 2 (3 weeks): Generics & Decorators
      🔹 Phase 3 (2 weeks): Type Inference
      🔹 Phase 4 (2 weeks): Advanced Types
      🔹 Phase 5 (2 weeks): Real-world Usage in React
    ROADMAP
  },
  {
    name: "Cloud Computing with AWS",
    description: "Deploy and manage applications on AWS.",
    estimated_duration: "3 months",
    roadmap: <<~ROADMAP
      🔹 Phase 1 (2 weeks): IAM & EC2
      🔹 Phase 2 (2 weeks): S3 & RDS
      🔹 Phase 3 (3 weeks): Networking & Route 53
      🔹 Phase 4 (2 weeks): CloudFront & CDN
      🔹 Phase 5 (2 weeks): Serverless with Lambda
    ROADMAP
  },
  {
    name: "System Design for Web Applications",
    description: "Design scalable and reliable systems.",
    estimated_duration: "3 months",
    roadmap: <<~ROADMAP
      🔹 Phase 1 (2 weeks): System Design Principles
      🔹 Phase 2 (3 weeks): Microservices Architecture
      🔹 Phase 3 (2 weeks): Databases & Caching
      🔹 Phase 4 (2 weeks): Load Balancing
      🔹 Phase 5 (2 weeks): Monitoring & Optimization
    ROADMAP
  },
  {
    name: "UI/UX Design Principles",
    description: "Create intuitive user experiences.",
    estimated_duration: "2 months",
    roadmap: <<~ROADMAP
      🔹 Phase 1 (2 weeks): Research & Personas
      🔹 Phase 2 (2 weeks): Wireframing
      🔹 Phase 3 (3 weeks): Prototyping
      🔹 Phase 4 (2 weeks): Usability Testing
      🔹 Phase 5 (2 weeks): Accessibility & Handoff
    ROADMAP
  },
  {
    name: "API Design and Development",
    description: "Create RESTful and GraphQL APIs that scale.",
    estimated_duration: "2 months",
    roadmap: <<~ROADMAP
      🔹 Phase 1 (2 weeks): RESTful Routes
      🔹 Phase 2 (3 weeks): Error Handling
      🔹 Phase 3 (2 weeks): Pagination & Filtering
      🔹 Phase 4 (2 weeks): API Documentation
      🔹 Phase 5 (2 weeks): Rate Limiting & Security
    ROADMAP
  },
  {
    name: "Database Design and Optimization",
    description: "Learn how to design and optimize databases.",
    estimated_duration: "2 months",
    roadmap: <<~ROADMAP
      🔹 Phase 1 (2 weeks): Relational Database Concepts
      🔹 Phase 2 (3 weeks): Query Optimization
      🔹 Phase 3 (2 weeks): Indexing Strategies
      🔹 Phase 4 (2 weeks): Normalization & Denormalization
      🔹 Phase 5 (2 weeks): Migration & Backup
    ROADMAP
  },
  {
    name: "Web Performance Optimization",
    description: "Improve website speed and efficiency.",
    estimated_duration: "2 months",
    roadmap: <<~ROADMAP
      🔹 Phase 1 (2 weeks): Loading Strategies
      🔹 Phase 2 (3 weeks): Caching Techniques
      🔹 Phase 3 (2 weeks): Image Optimization
      🔹 Phase 4 (2 weeks): Code Minification
      🔹 Phase 5 (2 weeks): Performance Monitoring
    ROADMAP
  },
  {
    name: "Testing and Debugging",
    description: "Write tests and debug effectively.",
    estimated_duration: "2 months",
    roadmap: <<~ROADMAP
      🔹 Phase 1 (2 weeks): Unit Testing
      🔹 Phase 2 (3 weeks): Integration Testing
      🔹 Phase 3 (2 weeks): Test Coverage
      🔹 Phase 4 (2 weeks): Debugging Tools
      🔹 Phase 5 (2 weeks): Continuous Testing
    ROADMAP
  },
  {
    name: "Agile and Project Management",
    description: "Use Agile methodologies to manage software projects.",
    estimated_duration: "2 months",
    roadmap: <<~ROADMAP
      🔹 Phase 1 (2 weeks): Agile Principles
      🔹 Phase 2 (3 weeks): Scrum Framework
      🔹 Phase 3 (2 weeks): Kanban Boards
      🔹 Phase 4 (2 weeks): Jira & Trello
      🔹 Phase 5 (2 weeks): Retrospectives & Sprint Planning
    ROADMAP
  }
]

puts "\nCreating skills with roadmaps..."

skills = skills_data.map do |data|
  Skill.create!(
    name: data[:name],
    description: data[:description],
    estimated_duration: data[:estimated_duration],
    roadmap: data[:roadmap]
  )
end

puts "Created #{skills.count} skills"

# Assign learning paths to each user
users.each_with_index do |user, index|
  3.times do |i|
    skill_index = (index * 3 + i) % skills.size
    skill = skills[skill_index]
    puts "🧠 #{user.email} is starting a learning path in '#{skill.name}'..."
    learning_path = LearningPath.create!(
      user: user,
      skill: skill
    )

    # Generate milestones specific to this skill
    generate_milestones(skill.name).each_with_index do |milestone_data, j|
      Milestone.create!(
        title: milestone_data[:title],
        description: milestone_data[:description],
        position: j + 1,
        learning_path: learning_path,
        completed: [true, false].sample
      )
    end

    puts "🗺️ Created learning path with milestones for #{skill.name}"
  end
end

puts "\n✅ Database seeded successfully!"
puts "Created #{User.count} users"
puts "Created #{Skill.count} skills"
puts "Created #{LearningPath.count} learning paths"
puts "Created #{Milestone.count} milestones"

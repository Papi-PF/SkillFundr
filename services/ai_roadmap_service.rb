class AiRoadmapService
  CACHE_PREFIX = "ai_roadmap"
  MAX_AI_RETRIES = 3

  def self.generate(skill, user)
    new(skill, user).generate
  end

  def initialize(skill, user)
    @skill = skill
    @user = user
  end

  def generate
    Rails.cache.fetch(cache_key, expires_in: 1.week) do
      retry_count = 0
      begin
        create_roadmap
      rescue => e
        retry_count += 1
        Rails.logger.error "AI Roadmap Error (Attempt #{retry_count}): #{e.message}"
        retry if retry_count < MAX_AI_RETRIES
        fallback_roadmap
      end
    end
  end

  private

  def cache_key
    "#{CACHE_PREFIX}/v2/skills/#{@skill.id}/users/#{@user&.id}"
  end

  def create_roadmap
    if user_over_limit?
      return fallback_roadmap
    end

    client = OpenAI::Client.new(access_token: ENV['OPENAI_API_KEY'])
    response = client.chat(
      parameters: {
        model: "gpt-3.5-turbo",
        messages: [{ role: "user", content: prompt }],
        temperature: 0.7,
        max_tokens: 1000
      }
    )

    validate_roadmap(parse_response(response))
  end

  def prompt
    <<~PROMPT
      Generate a personalized learning roadmap for #{@user&.name || "a developer"} learning #{@skill.name}.
      Respond in JSON format:
      {
        "roadmap": [
          {
            "title": "...",
            "description": "...",
            "objectives": ["..."]
          }
        ]
      }

      Guidelines:
      1. Create exactly 5 milestones
      2. Progress from basic to advanced
      3. Include practical exercises
      4. Focus on #{@skill.description}
      5. Use real-world examples from the #{@skill.name} field
    PROMPT
  end

  def parse_response(response)
    JSON.parse(response.dig("choices", 0, "message", "content"))
  end

  def validate_roadmap(json)
    roadmap = json["roadmap"]
    raise "Invalid roadmap structure" unless roadmap.is_a?(Array)

    roadmap.map do |milestone|
      {
        title: milestone["title"] || "Untitled Milestone",
        description: milestone["description"] || "",
        objectives: milestone["objectives"] || []
      }
    end
  end

  def fallback_roadmap
    case @skill.name
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
        { title: "Introduction", description: "Get started with #{@skill.name}" },
        { title: "Core Concepts", description: "Learn fundamental principles" },
        { title: "Practical Application", description: "Apply concepts in projects" },
        { title: "Advanced Topics", description: "Explore advanced techniques and best practices" },
        { title: "Capstone Project", description: "Build a final project to demonstrate mastery" }
      ]
    end
  end

  private

  def user_over_limit?
    return false unless @user

    key = "ai_requests:#{@user.id}"
    count = Redis.current.incr(key)
    Redis.current.expire(key, 60) if count == 1
    count > 5 # 5 requests per minute
  end
end

# db/seeds.rb

# Create Users if they don't already exist
user1 = User.find_or_create_by!(email: "user1@example.com") do |user|
  user.password = "password123"
  user.role = "volunteer"
  user.confirmed_at = Time.now
end

user2 = User.find_or_create_by!(email: "user2@example.com") do |user|
  user.password = "password123"
  user.role = "volunteer"
  user.confirmed_at = Time.now
end

user3 = User.find_or_create_by!(email: "organization@example.com") do |user|
  user.password = "password123"
  user.role = "organization"
  user.confirmed_at = Time.now
end

# Create Opportunities for users if they don't already exist
Opportunity.find_or_create_by!(title: "Software Developer", user: user3) do |opportunity|
  opportunity.description = "Looking for an experienced software developer"
  opportunity.skills_required = "Ruby, Rails, JavaScript"
  opportunity.location = "Remote"
  opportunity.start_date = "2025-01-01"
  opportunity.end_date = "2025-06-01"
end

Opportunity.find_or_create_by!(title: "Project Manager", user: user2) do |opportunity|
  opportunity.description = "Looking for a project manager with experience in agile methodologies"
  opportunity.skills_required = "Agile, Scrum, Project Management"
  opportunity.location = "New York"
  opportunity.start_date = "2025-02-01"
  opportunity.end_date = "2025-08-01"
end

# Create Applications for users if they don't already exist
Application.find_or_create_by!(user: user1, status: "Pending")
Application.find_or_create_by!(user: user2, status: "Accepted")

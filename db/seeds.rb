# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# db/seeds.rb

# Create Users
user1 = User.create!(
  email: "user1@example.com",
  password: "password123",
  role: "volunteer",
  confirmed_at: Time.now
)

user2 = User.create!(
  email: "user2@example.com",
  password: "password123",
  role: "volunteer",
  confirmed_at: Time.now
)

user3 = User.create!(
  email: "admin@example.com",
  password: "password123",
  role: "admin",
  confirmed_at: Time.now
)

# Create Opportunities for users
Opportunity.create!(
  title: "Software Developer",
  description: "Looking for an experienced software developer",
  skills_required: "Ruby, Rails, JavaScript",
  location: "Remote",
  start_date: "2025-01-01",
  end_date: "2025-06-01",
  user: user3
)

Opportunity.create!(
  title: "Project Manager",
  description: "Looking for a project manager with experience in agile methodologies",
  skills_required: "Agile, Scrum, Project Management",
  location: "New York",
  start_date: "2025-02-01",
  end_date: "2025-08-01",
  user: user2
)

# Create Applications for users
Application.create!(
  user: user1,
  status: "Pending"
)

Application.create!(
  user: user2,
  status: "Accepted"
)

json.extract! opportunity, :id, :title, :description, :skills_required, :location, :start_date, :end_date, :user_id, :created_at, :updated_at
json.url opportunity_url(opportunity, format: :json)

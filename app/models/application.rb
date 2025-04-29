# app/models/application.rb
class Application < ApplicationRecord
  belongs_to :user
  belongs_to :opportunity

  VALID_STATUSES = ["applied", "accepted", "rejected"]

  validates :user_id, uniqueness: { scope: :opportunity_id, message: "has already applied" }
  validates :status, inclusion: { in: VALID_STATUSES }
end

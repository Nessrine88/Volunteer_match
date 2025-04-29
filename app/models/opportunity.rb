class Opportunity < ApplicationRecord
   has_many :applications, dependent: :destroy
   has_many :users, through: :applications
  belongs_to :user
  validates :title, :description, :location, :start_date, :end_date, presence: true
end

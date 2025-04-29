class Opportunity < ApplicationRecord
   has_many :applications
   has_many :users, through: :applications
  belongs_to :user
end

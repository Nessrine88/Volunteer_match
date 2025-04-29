class Opportunity < ApplicationRecord
   has_many :applications
  has_many :volunteers, through: :applications, source: :volunteer
  belongs_to :user
end

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

         ROLES = [ "volunteer", "organization" ]

         validates :role, inclusion: { in: [ "volunteer", "organization" ], message: "%{value} is not a valid role" }
end

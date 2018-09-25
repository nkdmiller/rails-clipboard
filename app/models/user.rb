class User < ApplicationRecord
	  has_secure_password
	  has_many :tasks
	has_many :projects, through: :tasks
	validates :name, length: { minimum: 2 }
  	validates :email, length: { maximum: 30 }
  	validates :password, length: { in: 6..20 }
  	validates_format_of :email, :with => /@/
end

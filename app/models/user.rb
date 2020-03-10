class User < ApplicationRecord
	has_secure_password

	validates :first_name, presence: true
	validates :last_name, presence: true
	validates :password, presence: true, length: { minimum: 6 }
	validates :email, uniqueness: true, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
	
	belongs_to :accountable, polymorphic: true
end

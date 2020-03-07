class User < ApplicationRecord
	has_secure_password

	belongs_to :accountable, polymorphic: true
end

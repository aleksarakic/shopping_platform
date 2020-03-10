class Buyer < ApplicationRecord
	include Accountable

	validates :name, presence: true
	validates :type, inclusion: { in: %w(Buyer), message: "type has to be Buyer" }
	validates :address, presence: true
end

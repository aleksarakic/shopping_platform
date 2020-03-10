class Supplier < ApplicationRecord
	include Accountable

	validates :name, presence: true
	validates :type, inclusion: { in: %w(Supplier), message: "type has to be Supplier" }
	validates :address, presence: true

	has_many :products
	
	def self.search(name)
		if name
			self.where('name ILIKE ?', "%#{name}%").all
		else
			self.all
		end
	end
end

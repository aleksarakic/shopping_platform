class Supplier < ApplicationRecord
	include Accountable
	has_many :products

	def self.search(name)
		if name
			self.where('name ILIKE ?', "%#{name}%").all
		else
			self.all
		end
	end
end

class Supplier < ApplicationRecord
	include Accountable
	has_many :products
end

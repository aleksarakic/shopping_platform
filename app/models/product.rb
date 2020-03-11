class Product < ApplicationRecord
	
	validates :name, presence: true
	validates :price, presence: true
	validates :quantity, presence: true, :numericality => { greater_than: -1 }
	validates :category, presence: true, inclusion: { in: %w(A B C D), message: "type has to be either A or B or C or D" }
	
	belongs_to :supplier

	def self.sort(params)
		self.where(supplier_id: params[:id]).order("#{params[:search_param]} ASC")
	end
end
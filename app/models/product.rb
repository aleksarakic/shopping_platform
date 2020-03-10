class Product < ApplicationRecord
	belongs_to :supplier

	def self.sort(params)
		self.where(supplier_id: params[:id]).order("#{params[:search_param]} ASC")
	end
end
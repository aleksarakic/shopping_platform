class BuyersController < ApplicationController

	def home
		@suppliers = Supplier.search(params[:search])
	end

	def new
		@buyer = Buyer.new
		authorize @buyer
	end

	def create
		@buyer = Buyer.create(buyer_params)
		authorize @buyer
		if @buyer
			redirect_to log_in_path
		else
			render :nothing => true, :status => :bad_request
		end
	end

	private
	def buyer_params
		params.require(:buyer).permit(:name, :type, :description, :address)
	end
end

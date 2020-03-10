class SuppliersController < ApplicationController

	def shop
  	@supplier = Supplier.find(params[:id])
		authorize @supplier

		search_param = params[:search_param]
		if search_param
			@products = Product.sort(params)
		else
			@products = @supplier.products
		end
	end

  def home
  	redirect_to suppliers_shop_path(current_user.accountable_id)
  end

	def new
		@supplier = Supplier.new
	end

	def create
		@supplier = Supplier.create(supplier_params)
		if @supplier
			redirect_to log_in_path
		else
			render :nothing => true, :status => :bad_request
		end
	end

  def show
  	@supplier = Supplier.find(current_user.accountable_id)
  	authorize @supplier
  end

  private
  def supplier_params
  	params.require(:supplier).permit(:name, :type, :description, :address)
  end
end
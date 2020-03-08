class BuyersController < ApplicationController

	def home
		@suppliers = Supplier.all
	end

  def create
  end

  def new
  end

  def show
  end
end

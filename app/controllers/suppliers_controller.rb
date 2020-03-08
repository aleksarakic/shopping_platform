class SuppliersController < ApplicationController

  def show
  	@supplier = Supplier.find(current_user.accountable_id)
  end

  def new
  end

  def create
  end
end

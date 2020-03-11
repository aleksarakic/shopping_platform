class OrdersController < ApplicationController

  def index
    @orders = Order.all
    authorize @orders
  end

  def show
    @order = Order.find(params[:id])
    authorize @order
  end

  def new
    @order = Order.new
    authorize @order
  end

  def create
  	@order = Order.new(order_params)
    authorize @order
	  @current_cart.line_items.each do |item|
	    @order.line_items << item
	    item.cart_id = nil
      item.product.quantity -= item.quantity
      
      unless item.product.save
        flash.alert = 'Order declined. Exceeds capacity.'
        redirect_to root_path and return
      end
	  end
	  @order.save
	  Cart.destroy(session[:cart_id])
	  session[:cart_id] = nil
	  redirect_to root_path
	end

	private
  def order_params
    params.require(:order).permit(:name, :email, :delivery_address, :pay_method)
  end
end

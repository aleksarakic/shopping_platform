class ApplicationController < ActionController::Base
	include Pundit

  protect_from_forgery with: :exception
  before_action :current_cart

	def current_user
  	@current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def nullify_session
  	session[:user_id] = nil
  	current_user = nil
  end

  private
  def current_cart
    if session[:cart_id]
      cart = Cart.find_by(:id => session[:cart_id])
      if cart.present?
        @current_cart = cart
      else
        session[:cart_id] = nil
      end
    end

    if session[:cart_id] == nil
      @current_cart = Cart.create
      session[:cart_id] = @current_cart.id
    end
  end
end

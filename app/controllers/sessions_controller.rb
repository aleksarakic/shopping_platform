class SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def new
  	if current_user
      redirect_to home_path(current_user)
      return
    end
  end

  def create
  	@user = User.where(email: params[:email]).first
		if @user && @user.authenticate(params[:password])
			session[:user_id] = @user.id
			redirect_to home_path
		else
			redirect_to log_in_path
		end
  end

  def destroy
  	nullify_session
  	redirect_to '/'
  end
end

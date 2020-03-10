class UsersController < ApplicationController
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    params_hash = user_params.to_h
    accountable = Object.const_get(params_hash[:accountable_type].capitalize).where(id: params_hash[:accountable_id]).first
    render :nothing => true, :status => :bad_request unless accountable

    @user.accountable = accountable
    @user.save
    if @user.persisted?
      session[:user_id] = @user.id
      redirect_to home_path
    else
      render :nothing => true, :status => :bad_request      
    end
  end

  def show
  	if current_user
  		@user = current_user
  	else
  		redirect_to log_in_path
  	end
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :password, :email, :accountable_id, :accountable_type)
  end
end

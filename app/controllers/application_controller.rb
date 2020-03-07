class ApplicationController < ActionController::Base
	def current_user
  	@current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def nullify_session
  	session[:user_id] = nil
  	current_user = nil
  end
end

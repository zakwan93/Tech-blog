class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception

	helper_method :currunt_user, :logged_in?

	def currunt_user
		@currunt_user ||= User.find(session[:user_id]) if (session[:user_id])
	end

	def logged_in?
		# To return boolean values
		!!currunt_user
	end

	def require_user
		if !logged_in?
			flash[:danger] = "You must be logged in to perform that action"
			redirect_to root_path
		end
	end
end

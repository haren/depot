class ApplicationController < ActionController::Base
	before_filter :authorize
  protect_from_forgery

#	helper_method :logged_in?

#	def logged_in?
#		if session[:user_id]
#			return true
#		end
#	end

	private
	
	def current_cart
		Cart.find(session[:cart_id])
	rescue ActiveRecord::RecordNotFound
		cart = Cart.create
		session[:cart_id] = cart.id
		cart
	end

protected

	def authorize
		unless User.find_by_id(session[:user_id])
			redirect_to login_url, :notice => "Please log in"
		end
	end
end

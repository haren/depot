class StoreController < ApplicationController
	skip_before_filter :authorize

  def index
		if params[:set_locale]
			redirect_to store_path(:locale => params[:set_locale])
		else
			@products = Product.all
			@cart = current_cart
			@viewed = increment_counter
		end
  end

	def increment_counter
		session[:index_viewed] ||= 0
		session[:index_viewed] += 1
	end

end

class StoreController < ApplicationController
	skip_before_filter :authorize

  def index
		@products = Product.all
		@cart = current_cart
		@viewed = increment_counter
  end

	def increment_counter
		session[:index_viewed] ||= 0
		session[:index_viewed] += 1
	end

end

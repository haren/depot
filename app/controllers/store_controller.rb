class StoreController < ApplicationController
  def index
		@products = Product.all
		@viewed = increment_counter
  end

	def increment_counter
		session[:index_viewed] ||= 0
		session[:index_viewed] += 1
	end

end

class LineItem < ActiveRecord::Base
	belongs_to :cart
	belongs_to :product

	def total_price
		product.price * quantity
	end

	def update_quantity
		update_attribute :quantity, self.quantity - 1
	end
end

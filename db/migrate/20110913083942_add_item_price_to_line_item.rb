class AddItemPriceToLineItem < ActiveRecord::Migration
  def self.up
		add_column :line_items, :price, :decimal, :precision => 8, :scale => 2

		#update existing line items
		LineItem.find(:all).each do |item|
			update_attribute :price, item.product.price if item.product
		end
  end

	def self.down
		remove_column :line_items, :price
	end

end

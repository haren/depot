class Product < ActiveRecord::Base
	default_scope :order => 'title'
	has_many :line_items
	has_many :orders, :through => :line_items
	before_destroy :ensure_not_referenced_by_any_line_item

	validates :title, :description, :image_url, :presence => true
	validates :price, :numericality => {:greater_than_or_equal_to => 0.01}
	validates :title, :uniqueness => true, :length => {:minimum => 10, :message => 'must be at least 10 characters long'}
	validates :image_url, :format => {:with	=> %r{\.(gif|jpg|png)$}i,	:message => 'must be a URL for GIF, JPG or PNG image.'}

  def self.find_products_for_sale
    find(:all, :order => "title", :conditions => {:locale => I18n.locale})
  end

	private
	
	def ensure_not_referenced_by_any_line_item
		if line_items.empty?
			return true
		else
			errors.add(:base, 'Line Items present')
			return false
		end
	end

end

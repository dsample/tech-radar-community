class Technology < ActiveRecord::Base
  belongs_to :category
  has_many :product_technologies
  has_many :products, :through => :product_technologies
  has_many :comments, :as => :commentable
  has_many :recommends, :as => :recommendable
  attr_accessible :category_id, :description, :name, :summary

  before_destroy :confirm_orphan

	def products_using_this
    product_technologies.select("product_id, max(date(created_at)), state_id ").group("product_id")
	end

	def products_not_using_this
		return Product.find(:all) if product_technologies.count == 0
		Product.where('id not in (?)', product_technologies.map(&:product_id).join(','))
	end

  protected

  def confirm_orphan
  	is_orphan = true

    if products.count > 0
    	is_orphan = false
    	errors.add(:base, 'The technology has connected products, remove them before deleting the technology.')
    end

    if recommends.count > 0
    	is_orphan = false
    	errors.add(:base, 'The technology has connected recommendations, remove them before deleting the technology.' )
    end

    return is_orphan
  end
end

class Product < ActiveRecord::Base
  has_many :product_technologies
  has_many :technologies, :through => :product_technologies
  has_many :comments, :as => :commentable
  attr_accessible :name
  
  validates :name, :presence => true

  before_destroy :confirm_orphan

  protected

	def confirm_orphan
	  	is_orphan = true

	    if technologies.count > 0
	    	is_orphan = false
	    	errors.add(:base, 'The technology has connected technologies, remove them before deleting the product.')
	    end

	    if comments.count > 0
	    	is_orphan = false
	    	errors.add(:base, 'The product has connected comments, remove them before deleting the product.' )
	    end

	    return is_orphan
	  end
	end

end

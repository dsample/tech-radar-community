class Technology < ActiveRecord::Base
  acts_as_tenant(:company)

  belongs_to :company
  belongs_to :category
  has_many :product_technologies, :dependent => :delete_all
  has_many :products, :through => :product_technologies
  has_many :comments, :as => :commentable, :dependent => :delete_all
  has_many :recommends, :as => :recommendable
  attr_accessible :category_id, :description, :name, :summary

  validates :category, :name, :presence => true

  before_destroy :confirm_orphan

	def products_using_this
    products.map {|x| 
      pt = product_technologies
        .where(:product_id => x.id)
        .order("created_at DESC")
        .first

      { name: x.name, product: x, state: pt.state.name }
    }
	end

	def products_not_using_this
		#return Product.find(:all) if product_technologies.count == 0
		Product.where('id not in (?)', product_technologies.map(&:product_id))
	end

  def orphan?
    !(connected_products? || connected_recommendations?)
  end

  def active?
    deleted_at.nil?
  end

  def deleted?
    !active?
  end

  protected

  def confirm_orphan
  	is_orphan = true

    if connected_products?
    	is_orphan = false
    	errors.add(:base, 'The technology has connected products, remove them before deleting the technology.')
    end

    if connected_recommendations?
    	is_orphan = false
    	errors.add(:base, 'The technology has connected recommendations, remove them before deleting the technology.' )
    end

    return is_orphan
  end

  def connected_products?
    products.count > 0
  end

  def connected_recommendations?
    recommends.count > 0
  end
end

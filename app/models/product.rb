class Product < ActiveRecord::Base
  acts_as_tenant(:company)

  belongs_to :company
  has_many :product_technologies, :dependent => :delete_all
  has_many :technologies, :through => :product_technologies
  has_many :states, :through => :product_technologies
  has_many :comments, :as => :commentable, :dependent => :delete_all
  attr_accessible :name
  
  validates :name, :presence => true

  #before_destroy :confirm_orphan

  def used_technologies
    product_technologies.select("technology_id, max(date(created_at)), state_id ").group("technology_id")
  end

  def unused_technologies
    return Technology.find(:all) if product_technologies.count == 0
    Technology.where('id not in (?)', product_technologies.map(&:technology_id).reject! { |c| c.nil? }.join(','))
  end

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

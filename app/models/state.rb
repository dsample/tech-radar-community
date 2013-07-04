class State < ActiveRecord::Base
	has_many :product_technologies, :dependent => :delete_all
	has_many :products, :through => :product_technologies
	has_many :technologies, :through => :product_technologies

  attr_accessible :description, :name

  # TODO: Add before_destroy confirm_orphan
end

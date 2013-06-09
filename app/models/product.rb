class Product < ActiveRecord::Base
  has_many :technologies, :through => :product_technologies
  attr_accessible :name
end

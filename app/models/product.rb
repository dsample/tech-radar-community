class Product < ActiveRecord::Base
  has_many :product_technologies
  has_many :technologies, :through => :product_technologies
  has_many :comments, :as => :commentable
  attr_accessible :name
end

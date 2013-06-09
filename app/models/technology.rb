class Technology < ActiveRecord::Base
  belongs_to :category
  has_many :products, :through => :product_technologies
  has_many :comments, :as => :commentable
  attr_accessible :category_id, :description, :name, :summary
end

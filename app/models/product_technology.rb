class ProductTechnology < ActiveRecord::Base
  belongs_to :product
  belongs_to :technology
  belongs_to :state

  attr_accessible :product_id, :technology_id, :state_id

  validates :product, :technology, :state, :presence => true
  #validates_uniqueness_of :technology_id, :scope => :technology_id
end

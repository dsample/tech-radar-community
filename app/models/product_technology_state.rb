class ProductTechnologyState < ActiveRecord::Base
  belongs_to :product_technology
  belongs_to :state
  attr_accessible :product_technology_id, :state_id

  validates :product_technology_id, :state_id, :presence => true
  #validates_uniqueness_of :state_id, :scope => :product_technology_id
end

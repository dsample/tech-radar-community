class ProductTechnology < ActiveRecord::Base
  belongs_to :product
  belongs_to :technology
  has_many :product_technology_states
  has_many :states, :through => :product_technology_states
  attr_accessible :product_id, :technology_id

  validates :product, :technology, :presence => true
  validates_uniqueness_of :technology_id, :scope => :technology_id
end

class ProductTechnology < ActiveRecord::Base
  belongs_to :product
  has_one :technology
  has_one :state
  # attr_accessible :title, :body
end

class ProductTechnology < ActiveRecord::Base
  belongs_to :product
  belongs_to :technology
  belongs_to :state
  # attr_accessible :title, :body
end

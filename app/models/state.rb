class State < ActiveRecord::Base
	has_many :product_technologies
  attr_accessible :description, :name
end

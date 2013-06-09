class Category < ActiveRecord::Base
	has_many :technologies
  attr_accessible :description, :name

  validates :name, :description, :presence => true
end

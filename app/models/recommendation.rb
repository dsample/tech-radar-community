class Recommendation < ActiveRecord::Base

	has_many :recommends, :dependent => :delete_all
	has_many :technologies, :through => :recommends
  attr_accessible :description, :name

  validates :name, :description, :presence => true

  # TODO: Add before_destroy confirm_orphan
end

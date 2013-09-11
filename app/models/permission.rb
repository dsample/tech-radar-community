class Permission < ActiveRecord::Base
  attr_accessible :description, :name, :slug
end

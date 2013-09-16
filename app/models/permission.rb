class Permission < ActiveRecord::Base
  attr_accessible :description, :name, :slug

  has_many :roles, :through => :role_permissions
  has_many :users, :through => :user_company_roles
end

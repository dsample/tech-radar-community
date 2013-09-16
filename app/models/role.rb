class Role < ActiveRecord::Base
  acts_as_tenant(:company)

  has_many :role_permissions, :dependent => :delete_all
  has_many :permissions, :through => :role_permissions
  has_many :user_company_roles
  has_many :users, :through => :user_company_roles
  belongs_to :company

  attr_accessible :name
end
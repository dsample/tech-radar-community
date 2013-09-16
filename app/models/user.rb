class User < ActiveRecord::Base
  attr_accessible :display_name, :username

  has_many :identities, :class_name => "Identity"
  has_many :comments
  has_many :recommends

  has_many :user_company_roles
  has_many :companies, :through => :user_company_roles
  has_many :roles, :through => :user_company_roles
  has_many :permissions, :through => :roles

  def name
  	display_name || identities.first.name
  end

end

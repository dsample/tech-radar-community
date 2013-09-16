class Company < ActiveRecord::Base
  validates :slug, uniqueness: true

  attr_accessible :name, :slug

  has_many :user_company_roles, :dependent => :delete_all
  has_many :users, :through => :user_company_roles
  has_many :roles, dependent: :destroy

  has_many :categories
  has_many :technologies
  has_many :products

  def self.find_by_slug(slug)
  	Company.where(slug: slug).first
  end

  def to_param
  	return slug
  end
end
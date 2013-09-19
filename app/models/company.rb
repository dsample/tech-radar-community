class Company < ActiveRecord::Base
  validates :name,
    length: { within: 3..10, 
      message: 'must be between 3 and 10 characters' }

  validates :slug,
    uniqueness: { case_sensitive: false, 
      message: '%{value} is already taken' },
    exclusion: { in: %w(www admin test), 
      message: '%{value} is reserved' },
    format: { with: /\A[a-zA-Z0-9-_]+\z/, 
      message: 'must only contain letters, numbers, and may also include dash and underscore characters' },
    length: { within: 3..10, 
      message: 'must be between 3 and 10 characters' }

  attr_accessible :name, :slug

  has_many :user_company_roles, :dependent => :delete_all
  has_many :users, :through => :user_company_roles
  has_many :roles, dependent: :destroy

  has_many :categories
  has_many :technologies
  has_many :products

  def slug= name
    super(name.try(:downcase))
  end

  def self.find_by_slug(slug)
  	Company.where(slug: slug).first
  end

  def to_param
  	return slug
  end
end
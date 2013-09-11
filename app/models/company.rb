class Company < ActiveRecord::Base
  validates :slug, uniqueness: true

  attr_accessible :name, :slug

  def self.find_by_slug(slug)
  	Company.where(slug: slug).first
  end
end
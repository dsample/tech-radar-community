class Category < ActiveRecord::Base
  acts_as_tenant(:company)

	has_many :technologies
  attr_accessible :description, :name

  validates :name, :description, :presence => true

  before_destroy :confirm_orphan

  protected

  def confirm_orphan
  	is_orphan = true

    if technologies.count > 0
    	is_orphan = false
    	errors.add(:base, 'The category has connected technologies, remove them before deleting the category.')
    end

    return is_orphan
  end
end

class Category < ActiveRecord::Base
  acts_as_tenant(:company)

  belongs_to :company
	has_many :technologies
  attr_accessible :description, :name

  validates :name, :presence => true

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

class UserCompanyRole < ActiveRecord::Base
  acts_as_tenant(:company)

  belongs_to :company
  belongs_to :user
  belongs_to :role
end

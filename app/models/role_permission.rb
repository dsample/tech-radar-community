class RolePermission < ActiveRecord::Base
  belongs_to :role
  belongs_to :permission
  # attr_accessible :title, :body
end

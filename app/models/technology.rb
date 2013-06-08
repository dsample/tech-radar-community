class Technology < ActiveRecord::Base
  belongs_to :category
  attr_accessible :category_id, :description, :name, :summary
end

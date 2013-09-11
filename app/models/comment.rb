class Comment < ActiveRecord::Base
  acts_as_tenant(:company)

  belongs_to :commentable, :polymorphic => true
  belongs_to :user

  attr_accessible :body
  
  validates :body, :presence => true
end

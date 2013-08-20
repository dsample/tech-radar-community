class Comment < ActiveRecord::Base
  belongs_to :commentable, :polymorphic => true
  belongs_to :user

  attr_accessible :body
  
  validates :body, :presence => true
end

class Recommend < ActiveRecord::Base
  acts_as_tenant(:company)

  belongs_to :recommendable, :polymorphic => true
  belongs_to :recommendation
  belongs_to :user

  attr_accessible :recommendation_id, :context

  validates :context, :presence => true
end

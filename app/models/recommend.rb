class Recommend < ActiveRecord::Base
  belongs_to :recommendable, :polymorphic => true
  belongs_to :recommendation

  attr_accessible :recommendation_id, :context

  validates :context, :presence => true
end

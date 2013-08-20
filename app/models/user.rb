class User < ActiveRecord::Base
  attr_accessible :display_name, :username

  has_many :identities, :class_name => "Identity"
  has_many :comments
  has_many :recommends
end

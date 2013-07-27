class Buddy < ActiveRecord::Base
  attr_accessible :user, :buddy, :is_buddy

  belongs_to :user
  belongs_to :buddy, :class_name => 'User', :foreign_key => 'buddy_id'
end

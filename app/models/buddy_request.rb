class BuddyRequest < ActiveRecord::Base
  attr_accessible :status, :buddy, :user

  belongs_to :user
  belongs_to :buddy, :class_name => 'User', :foreign_key => 'buddy_id'
  scope :accepted, where(status: 'accepted')
  scope :pending, where(status: 'pending')
  scope :rejected, where(status: 'rejected')
end

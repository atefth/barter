class Message < ActiveRecord::Base
  attr_accessible :body, :to, :from, :seen
  belongs_to :sender, :class_name => 'User', :foreign_key => 'from'
  belongs_to :receiver, :class_name => 'User', :foreign_key => 'to'
  scope :unseen, where(seen: false)
end

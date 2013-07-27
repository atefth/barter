class Notification < ActiveRecord::Base
  attr_accessible :buddies_good_upload,:seen, :good, :user, :uploader
  belongs_to :user
  belongs_to :uploader, :class_name => 'User', :foreign_key => 'uploader_id'
  belongs_to :good
  scope :unseen, where(seen: false)
end

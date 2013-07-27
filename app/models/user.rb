class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :trackable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :username, :password, :password_confirmation, :remember_me
  attr_accessible :area, :birth_year, :city, :country, :district, :email, :f_name, :gender, :image, :l_name, :phone, :postal, :profession, :fullname
  mount_uploader :image, ImageUploader

  acts_as_gmappable

  validates_presence_of :username, :email, :password
  has_many :goods
  has_many :needed_goods
  has_many :comments
  has_many :sent_messages, :class_name => 'Message', :foreign_key => 'from'
  has_many :received_messages, :class_name => 'Message', :foreign_key => 'to'
  has_many :notifications
  has_many :notifieds, :class_name => 'Notification', :foreign_key => 'uploader_id'
  has_many :sent_buddy_requests, :class_name => 'BuddyRequest', :foreign_key => 'user_id'
  has_many :received_buddy_requests, :class_name => 'BuddyRequest', :foreign_key => 'buddy_id'
  has_and_belongs_to_many :buddies, :class_name => 'User', :join_table => 'buddies_users', :association_foreign_key => 'buddy_id'

  def gmaps4rails_address
    "#{area}, #{city}, #{district}, #{country}, #{postal}"
  end

end

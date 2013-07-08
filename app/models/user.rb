class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :trackable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :username, :password, :password_confirmation, :remember_me
  attr_accessible :area, :birth_year, :city, :country, :district, :email, :f_name, :gender, :image, :l_name, :phone, :postal, :profession
  mount_uploader :image, ImageUploader

  validates_presence_of :username, :email, :password
  has_many :goods
  has_many :needed_goods
  has_many :comments
  has_many :sent_messages, :class_name => 'Messages', :foreign_key => 'to'
  has_many :received_messages, :class_name => 'Messages', :foreign_key => 'from'

  scope :find_by_fullname, lambda { |fullname| where(:fullname => fullname) }
end

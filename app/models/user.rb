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

  validates_presence_of :username, :area, :gender, :city, :f_name, :l_name, :phone, :country
end

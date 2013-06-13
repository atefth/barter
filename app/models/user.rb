class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :username, :password, :password_confirmation, :remember_me
  attr_accessible :area, :birth_year, :city, :country, :district, :email, :f_name, :gender, :image, :l_name, :phone, :postal, :profession
    mount_uploader :image, ImageUploader
end

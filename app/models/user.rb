class User < ActiveRecord::Base
  attr_accessible :area, :birth_year, :city, :country, :district, :email, :f_name, :gender, :image, :l_name, :phone, :postal, :profession
end

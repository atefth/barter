class Admin < ActiveRecord::Base
  attr_accessible :name, :username, :password, :email
end

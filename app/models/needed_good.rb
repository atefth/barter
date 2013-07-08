class NeededGood < ActiveRecord::Base
  attr_accessible :area, :brand, :category, :city, :country, :model
  belongs_to :user
end

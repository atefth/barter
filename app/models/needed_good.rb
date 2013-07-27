class NeededGood < ActiveRecord::Base
  attr_accessible :area, :brand, :category, :city, :country, :model
  belongs_to :user

  acts_as_gmappable

  def gmaps4rails_address
    "#{area} ,#{city}, #{country}"
  end

  def to_good
  	return "#{brand}#{category}#{model}"
  end

end

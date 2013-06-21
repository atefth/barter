class Item < ActiveRecord::Base
  attr_accessible :category, :description, :name, :rating
end

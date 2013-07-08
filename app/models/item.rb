class Item < ActiveRecord::Base
  attr_accessible :category, :description, :name, :rating, :image
  mount_uploader :image, ImageUploader
end

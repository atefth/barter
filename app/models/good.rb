class Good < ActiveRecord::Base
  attr_accessible :brand, :category, :description, :image, :model, :image_1, :image_2, :image_3, :image_4, :image_5, :image_6, :image_7
  mount_uploader :image, ImageUploader
  mount_uploader :image_1, ImageUploader
  mount_uploader :image_2, ImageUploader
  mount_uploader :image_3, ImageUploader
  mount_uploader :image_4, ImageUploader
  mount_uploader :image_5, ImageUploader
  mount_uploader :image_6, ImageUploader
  mount_uploader :image_7, ImageUploader

  belongs_to :user
  has_many :notifications
  has_many :comments  

  def to_good
    return "#{brand}#{category}#{model}"
  end

end

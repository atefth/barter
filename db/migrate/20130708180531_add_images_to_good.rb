class AddImagesToGood < ActiveRecord::Migration
  def change
    add_column :goods, :image_1, :string
    add_column :goods, :image_2, :string
    add_column :goods, :image_3, :string
    add_column :goods, :image_4, :string
    add_column :goods, :image_5, :string
    add_column :goods, :image_6, :string
    add_column :goods, :image_7, :string
  end
end

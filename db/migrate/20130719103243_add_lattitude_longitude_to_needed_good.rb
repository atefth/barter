class AddLattitudeLongitudeToNeededGood < ActiveRecord::Migration
  def change
  	add_column :needed_goods, :latitude, :float
    add_column :needed_goods, :longitude, :float
    add_column :needed_goods, :gmaps, :boolean
  end
end

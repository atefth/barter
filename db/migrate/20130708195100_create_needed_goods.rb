class CreateNeededGoods < ActiveRecord::Migration
  def change
    create_table :needed_goods do |t|
      t.string :category
      t.string :brand
      t.string :model
      t.string :area
      t.string :city
      t.string :country
      t.references :user

      t.timestamps
    end
  end
end

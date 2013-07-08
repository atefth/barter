class CreateGoods < ActiveRecord::Migration
  def change
    create_table :goods do |t|
      t.string :category
      t.string :brand
      t.string :model
      t.text :description
      t.string :image
      t.references :user

      t.timestamps
    end
  end
end

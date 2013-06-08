class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :f_name
      t.string :l_name
      t.string :email
      t.string :phone
      t.string :birth_year
      t.string :gender
      t.string :profession
      t.string :image
      t.string :area
      t.string :city
      t.string :district
      t.string :country
      t.string :postal

      t.timestamps
    end
  end
end

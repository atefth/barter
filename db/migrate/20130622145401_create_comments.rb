class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :comment
      t.references :user
      t.references :good
      t.timestamps
    end
  end
end

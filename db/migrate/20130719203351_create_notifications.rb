class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.boolean :buddies_good_upload
      t.boolean :matched_good
      t.boolean :seen
      t.references :user

      t.timestamps
    end
  end
end

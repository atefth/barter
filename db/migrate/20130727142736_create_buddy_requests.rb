class CreateBuddyRequests < ActiveRecord::Migration
  def change
    create_table :buddy_requests do |t|
      t.references :user
      t.references :buddy
      t.string :status

      t.timestamps
    end
  end
end

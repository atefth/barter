class BuddiesUsersJoin < ActiveRecord::Migration
  def change
    create_table :buddies_users do |t|
      t.references :user
      t.references :buddy
    end
  end
end

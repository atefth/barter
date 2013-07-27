class AddGoodIdToNotification < ActiveRecord::Migration
  def change
    add_column :notifications, :good_id, :integer
  end
end

class AddUploaderToNotification < ActiveRecord::Migration
  def change
  	add_column :notifications, :uploader_id, :integer
  end
end

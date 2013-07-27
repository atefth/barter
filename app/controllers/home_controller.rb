class HomeController < ApplicationController
  def index
  	if user_signed_in?
  		@page = 'home'
  		@good = Good.new
  		@needed_good = NeededGood.new
  		@my_goods = current_user.goods
  		@my_needed_goods = current_user.needed_goods
      @json = current_user.needed_goods.to_gmaps4rails      

      create_matched_goods_notifications
      render 'index'
  	else
  		redirect_to '/users/login'
  	end
  end

  def create_matched_goods_notifications
    notified_goods = Array.new
    current_user.notifications.each do |notification|
      notified_goods << notification.good.to_good
    end
    Good.all.each do |good|
      current_user.needed_goods.each do |needed_good|
        if good.to_good == needed_good.to_good
          if !notified_goods.include? good.to_good              
            new_notification = Notification.new
            new_notification.good = good
            new_notification.user = current_user
            new_notification.uploader = good.user
            new_notification.matched_good = true
            new_notification.buddies_good_upload = false
            new_notification.save
          end
        end
      end
    end
  end

end

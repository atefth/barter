class HomeController < ApplicationController
  def index
  	if user_signed_in?
  		@page = 'home'
  		@good = Good.new
  		@needed_good = NeededGood.new
  		@my_goods = current_user.goods
  		@my_needed_goods = current_user.needed_goods
  		render 'index'
  	else
  		redirect_to '/users/login'
  	end
  end
end

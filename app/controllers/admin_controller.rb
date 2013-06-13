class AdminController < ApplicationController
  def index
  	@page = 'admin'
  end

  def login
  	@page = 'login'
  end

  def see_users
  	@users = User.all
  end

end

class UsersController < ApplicationController
  before_filter :auth_user, except: [:signup]

  def auth_user
    redirect_to '/users/login' unless user_signed_in?
  end

  # GET /users
  # GET /users.json
  def index
    @users = User.all
    @unseen_messages = current_user.received_messages.unseen
    # redirect_to(:controller => 'home', :action => 'index')
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @page = 'profile'
    @user = User.find(params[:id])
    @user_map = current_user.to_gmaps4rails
    @unseen_messages = current_user.received_messages.unseen
  end

  def request_buddy
    buddy = User.find(params[:id])
    duplicate = false
    current_user.sent_buddy_requests.each do |request|
      if request.user == current_user and request.buddy == buddy
        duplicate = true
      end
    end
    if !duplicate
      request = BuddyRequest.new
      request.user = current_user
      request.buddy = buddy
      request.status = 'pending'
      if request.save
        flash[:notice] = 'Buddy request sent from approval.'
        redirect_to(:controller => 'home', :action => 'index')
      else
        flash[:notice] = 'Sorry, unable to request buddy.'
        redirect_to(:controller => 'home', :action => 'index')
      end
    else
      flash[:notice] = 'Sorry, unable to request buddy.'
      redirect_to(:controller => 'home', :action => 'index')
    end
  end

  def buddy_accepted
    request = BuddyRequest.find(params[:id])
    request.destroy
    redirect_to(:action => 'buddies')
  end

  def accept_buddy
    request = BuddyRequest.find(params[:id])
    request.buddy.buddies << current_user
    request.update_attributes(:status => 'accepted')
    flash[:notice] = 'Request Approved!'
    redirect_to(:action => 'index')
  end

  def reject_buddy
    request = BuddyRequest.find(params[:id])
    request.status = 'rejected'
    redirect_to(:action => 'index')
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @page = 'register'
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  def signup
    @user = User.new
    @user.email = params[:email]
    @user.username = params[:username]
    @user.password = Digest::MD5.hexdigest(params[:password])
    # @user.area = 'Dhaka'
    # @user.city = 'Dhaka'
    # @user.district = 'Dhaka'
    @user.country = 'Bangladesh'
    # @user.postal = '1000'
    @user.save
    flash[:notice] = "Please complete your profile."
    sign_in(@user, :bypass => true)
    redirect_to(:action => "edit", :id => @user.id)

  end

  def notifications
    @notifications = current_user.notifications
    @notifieds = current_user.notifieds
    @notifications.each do |notification|
      notification.update_attributes(:seen => true)
    end
    @notifieds.each do |notification|
      notification.update_attributes(:seen => true)
    end
    render 'notifications'
  end

  def buddies
    @requests = 0
    current_user.received_buddy_requests.each do |request|
      if request.status == 'pending'
        @requests = @requests + 1
      end
    end
    current_user.sent_buddy_requests.each do |request|
      if request.status == 'accepted' or request.status == 'rejected'
        request.destroy
      end
    end

  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    params[:user][:password] = Digest::MD5.hexdigest(params[:user][:password])
    @user = User.new(params[:user])
    fullname = params[:user][:f_name] + ' ' + params[:user][:l_name]
    @user.fullname = fullname
    if @user.save

      flash[:notice] = 'Thank you for signing up at Barter.com. We\'ll keep you updated as soon as we have more to offer.'
      redirect_to(:controller => 'home', :action => 'index')

    else

      flash[:notice] = 'Sorry there was an error!'
      redirect_to(:controller => 'user', :action => 'new')

    end
   
  end

  # def logout

  #   reset_session
  #   redirect_to(:controller => 'home', :action => 'index')

  # end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])
    fullname = params[:user][:f_name] + ' ' + params[:user][:l_name]
    @user.fullname = fullname
    sign_in(:user, @user)
    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    
    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end
end

class UsersController < ApplicationController
  # GET /users
  # GET /users.json
  def index
    @users = User.all

    redirect_to(:controller => 'home', :action => 'index')
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @page = 'profile'
    @user = User.find(params[:id])
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

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    params[:user][:password] = Digest::MD5.hexdigest(params[:user][:password])
    @user = User.new(params[:user])

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

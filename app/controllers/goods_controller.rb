class GoodsController < ApplicationController
  # GET /goods
  # GET /goods.json
  def index
    @goods = Good.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @goods }
    end
  end

  # GET /goods/1
  # GET /goods/1.json
  def show
    @good = Good.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @good }
    end
  end

  # GET /goods/new
  # GET /goods/new.json
  def new
    @good = Good.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @good }
    end
  end

  # GET /goods/1/edit
  def edit
    @good = Good.find(params[:id])
  end

  # POST /goods
  # POST /goods.json
  def create
    @good = Good.new(params[:good])
    @good.user = current_user
    if @good.save
      flash[:notice] = "You have uploaded a new good!"
    else
      flash[:notice] = "There was an error with your good"
    end
    redirect_to(:controller => 'home', :action => 'index')
  end

  # PUT /goods/1
  # PUT /goods/1.json
  def update
    @good = Good.find(params[:id])

    respond_to do |format|
      if @good.update_attributes(params[:good])
        format.html { redirect_to @good, notice: 'Good was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @good.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /goods/1
  # DELETE /goods/1.json
  def destroy
    @good = Good.find(params[:id])
    @good.destroy

    respond_to do |format|
      format.html { redirect_to goods_url }
      format.json { head :no_content }
    end
  end
end

class NeededGoodsController < ApplicationController
  # GET /needed_goods
  # GET /needed_goods.json
  def index
    @needed_goods = NeededGood.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @needed_goods }
    end
  end

  # GET /needed_goods/1
  # GET /needed_goods/1.json
  def show
    @needed_good = NeededGood.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @needed_good }
    end
  end

  # GET /needed_goods/new
  # GET /needed_goods/new.json
  def new
    @needed_good = NeededGood.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @needed_good }
    end
  end

  # GET /needed_goods/1/edit
  def edit
    @needed_good = NeededGood.find(params[:id])
  end

  # POST /needed_goods
  # POST /needed_goods.json
  def create
    @needed_good = NeededGood.new(params[:needed_good])
    @needed_good.user = current_user
    if @needed_good.save
      flash[:notice] = "You have uploaded a new good!"
    else
      flash[:notice] = "There was an error with your good"
    end
    redirect_to(:controller => 'home', :action => 'index')
  end

  # PUT /needed_goods/1
  # PUT /needed_goods/1.json
  def update
    @needed_good = NeededGood.find(params[:id])

    respond_to do |format|
      if @needed_good.update_attributes(params[:needed_good])
        format.html { redirect_to @needed_good, notice: 'Good was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @needed_good.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /needed_goods/1
  # DELETE /needed_goods/1.json
  def destroy
    @needed_good = NeededGood.find(params[:id])
    @needed_good.destroy

    respond_to do |format|
      format.html { redirect_to needed_goods_url }
      format.json { head :no_content }
    end
  end
end

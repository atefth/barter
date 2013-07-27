class MessagesController < ApplicationController
  # GET /messages
  # GET /messages.json
  def index
    @page = 'message'
    @message = Message.new
    @sent_messages = current_user.sent_messages
    @received_messages = current_user.received_messages
    users = Array.new
    User.all.each do |user|
      users << user.fullname unless user == current_user
    end
    @users = users.to_json
  end

  # GET /messages/1
  # GET /messages/1.json
  def show
    @message = Message.find(params[:id])
    @message.update_attributes(:seen => true)
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @message }
    end
  end

  # GET /messages/new
  # GET /messages/new.json
  def new
    @message = Message.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @message }
    end
  end

  # GET /messages/1/edit
  def edit
    @message = Message.find(params[:id])
  end

  # POST /messages
  # POST /messages.json
  def create
    params[:message][:to] = User.find_by_fullname(params[:message][:to]).id
    @message = Message.new(params[:message])
    @message.from = current_user.id
    @message.seen = false
    if @message.save
      flash[:notice] = "Message sent"
    else
      flash[:notice] = "Message not sent"
    end
    redirect_to(:action => 'index')
  end

  # PUT /messages/1
  # PUT /messages/1.json
  def update
    @message = Message.find(params[:id])

    respond_to do |format|
      if @message.update_attributes(params[:message])
        format.html { redirect_to @message, notice: 'Message was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /messages/1
  # DELETE /messages/1.json
  def destroy
    @message = Message.find(params[:id])
    @message.destroy

    respond_to do |format|
      format.html { redirect_to messages_url }
      format.json { head :no_content }
    end
  end
end

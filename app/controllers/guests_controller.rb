class GuestsController < ApplicationController

  before_filter :require_guest, :only => [:index, :show, :edit, :update, :destroy]
  before_filter :require_no_guest, :only => [:new, :create]

  # GET /guests
  def index
    @guests = Guest.all
  end

  # GET /guests/:id
  def show
    @guest = Guest.find(params[:id])
  end

  # GET /guests/new
  def new
    @guest = Guest.new
  end

  # GET /guests/:id/edit
  def edit 
    @guest = Guest.find(params[:id])
  end

  # POST /guests
  def create
    @guest = Guest.new(params[:guest])
    if @guest.save
      flash[:notice] = "Guest registered!"
      #redirect_to :controller => "guest_book", :action => "index"
      redirect_back_or_default guest_url
    else
      render :action => :new
    end
  end

  # PUT /guests/:id
  def update
    @guest = Guest.find(params[:id])
    if @guest.update_attributes(params[:guest])
      flash[:notice] = "Guest updated!"
      #redirect_to :controller => "guest_book", :action => "index"
      redirect_to guest_url
    else
      render :action => :edit
    end
  end

  # DELETE /guests/:id
  def destroy
    @guest = Guest.find(params[:id])
    @guest.destroy
    redirect_to guests_url
  end

end

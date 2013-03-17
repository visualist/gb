class GuestSessionsController < ApplicationController
  before_filter :require_no_guest, :only => [:new, :create]
  before_filter :require_guest, :only => :destroy
  
  def new
    @guest_session = GuestSession.new
  end
  
  def create
    @guest_session = GuestSession.new(params[:guest_session])
    if @guest_session.save
      flash[:notice] = "Login successful!"
      redirect_back_or_default guest_url
    else
      render :action => :new
    end
  end
  
  def destroy
    current_guest_session.destroy
    flash[:notice] = "Logout successful!"
    redirect_back_or_default new_guest_session_url
  end
end

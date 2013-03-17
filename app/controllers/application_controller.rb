class ApplicationController < ActionController::Base

  helper :all
  helper_method :current_guest_session, :current_guest
  protect_from_forgery
  
  private

  def current_guest_session
    return @current_guest_session if defined?(@current_guest_session)
    @current_guest_session = GuestSession.find
  end
    
  def current_guest
    return @current_guest if defined?(@current_guest)
    @current_guest = current_guest_session && current_guest_session.record
  end
    
  def require_guest
    unless current_guest
      store_location
      flash[:notice] = "You must be logged in to access this page"
      redirect_to new_guest_session_url
      return false
    end
  end

  def require_no_guest
    if current_guest
      store_location
      flash[:notice] = "You must be logged out to access this page"
      redirect_to :controller => "guest_book"
      return false
    end
  end
    
  def store_location
    session[:return_to] = request.fullpath
  end
    
  def redirect_back_or_default(default)
    redirect_to(session[:return_to] || default)
    session[:return_to] = nil
  end

end

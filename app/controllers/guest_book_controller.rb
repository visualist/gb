class GuestBookController < ApplicationController
  def index
    # FIXME: .order is not available w/Post.all, use workaround for the moment
    @posts = Post.where('1=1').order(:updated_at).reverse_order.page params[:page]
  end

  def byguest
    username = params[:username]
    return redirect_to :action=>"index" if username.nil? || username.empty?

    @user = Guest.find_by_username(username)
    return redirect_to :action=>"index" if @user.nil?

    @posts = Post.byusername(params[:username]).page params[:page]
  end

  def submit
  end
end

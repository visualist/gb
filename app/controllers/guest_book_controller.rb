class GuestBookController < ApplicationController
  def index
    # FIXME: .order is not available w/Post.all, use workaround for the moment
    @posts = Post.where('1=1').order(:updated_at).reverse_order.page params[:page]
  end

  def byguest
    username = params[:username]
    return redirect_to :action=>"index" if username.nil? || username.empty?

    @user = Guest.find_by_username(username)
    # TODO: flash message
    return redirect_to :action=>"index" if @user.nil?

    @posts = Post.byusername(params[:username]).page params[:page]
  end

  def submit
    title = params[:title]
    body = params[:post]
    post = Post.new
    post.assign_attributes({ :title => title, :body => body})
    post.guest = current_guest
    post.save
    return redirect_to :action=>"index"
  end
end

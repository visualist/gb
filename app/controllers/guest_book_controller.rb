class GuestBookController < ApplicationController
  def index
    # FIXME: .order is not available w/Post.all, use workaround for the moment
    @posts = Post.where('1=1').order(:updated_at).reverse_order
  end

  def byguest
    @posts = Post.byusername(params[:username])
  end

  def submit
  end
end

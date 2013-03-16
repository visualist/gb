class GuestBookController < ApplicationController
  def index
    @posts = Post.all
  end

  def byguest
  end

  def submit
  end
end

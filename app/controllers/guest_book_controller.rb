class GuestBookController < ApplicationController
  def index
    @guests = Guest.all
  end

  def byguest
  end

  def submit
  end
end

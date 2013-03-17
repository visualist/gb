class Guest < ActiveRecord::Base
  acts_as_authentic
  has_many :posts
  attr_accessible :username, :name, :location, :email
  attr_accessible :password, :password_confirmation

  def last_login_at
  end
end

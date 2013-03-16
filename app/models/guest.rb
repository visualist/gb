class Guest < ActiveRecord::Base
  has_many :posts
  # attr_accessible :title, :body
end

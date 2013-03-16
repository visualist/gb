class Post < ActiveRecord::Base
  belongs_to :guest
  # attr_accessible :title, :body
end

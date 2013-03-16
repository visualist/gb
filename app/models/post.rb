class Post < ActiveRecord::Base
  belongs_to :guest
  # attr_accessible :title, :body

  def author
    guest.nil? ? 'unknown' : guest.name
  end
end

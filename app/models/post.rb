class Post < ActiveRecord::Base
  belongs_to :guest
  # attr_accessible :title, :body

  def author
    guest.nil? ? 'unknown' : guest.name
  end

  def username
    guest.nil? ? "" : guest.username
  end

  def self.byusername(username)
    joins(:guest).where('guests.username' => username)
  end
end

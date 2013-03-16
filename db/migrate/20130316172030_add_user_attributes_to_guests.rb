class AddUserAttributesToGuests < ActiveRecord::Migration
  def change
    add_column :guests, :name, :string
    add_column :guests, :location, :string
    add_column :guests, :email, :string
    add_column :guests, :username, :string
    add_column :guests, :password, :string
  end
end

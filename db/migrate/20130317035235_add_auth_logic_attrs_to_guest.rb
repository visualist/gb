class AddAuthLogicAttrsToGuest < ActiveRecord::Migration
  def change
    add_column :guests, :crypted_password,  :string, :null => false
    add_column :guests, :password_salt,     :string, :null => false
    add_column :guests, :persistence_token, :string, :null => false
  end
end

class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.references :guest
      t.timestamps
    end
  end
end

class AddUsersNameToPost < ActiveRecord::Migration
  def self.up
    add_column :posts, :user_name, :string
  end

  def self.down
    remove_column :posts, :user_name
  end
end

class ChangeProfileUrlToProfileName < ActiveRecord::Migration
  def change
  	remove_column :users, :profile_url
  	add_column :users, :profile_name, :string
  end
end

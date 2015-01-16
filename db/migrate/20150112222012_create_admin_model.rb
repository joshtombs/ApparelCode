class CreateAdminModel < ActiveRecord::Migration
  def self.up
    create_table :admins do |t|
      t.column :username,      :string
      t.column :email,         :string
      t.column :password_hash, :string
      t.column :password_salt, :string
    end
  end

  def self.down
    drop_table :admins
  end
end

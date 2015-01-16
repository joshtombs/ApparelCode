class AddProfileInfoToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :age, :integer
    add_column :users, :country, :string
    add_column :users, :city, :string
  end

  def self.down
    remove_column :users, :age
    remove_column :users, :country
    remove_column :users, :city
  end
end

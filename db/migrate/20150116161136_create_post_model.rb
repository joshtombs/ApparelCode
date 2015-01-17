class CreatePostModel < ActiveRecord::Migration
  def self.up
    create_table :posts do |t|
      t.column :name,         :string
      t.column :user_id,      :integer
      t.column :description,  :string
      t.column :items,        :string
      t.column :tags,         :string
      t.column :created_at,   :datetime
    end
  end

  def self.down
    drop_table :posts
  end
end

class Post < ActiveRecord::Base
  belongs_to :user

  validates :user_id, presence: true
  validates :name, presence: true
  validates :description, length: {maximum: 250}

  private
  def post_params
    params.require(:post).permit(:name, :user_id, :description, :items, :tags, :user_name)
  end
end

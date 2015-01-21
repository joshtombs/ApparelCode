class PostController < ApplicationController
  def new_post
    @user = User.new
    @post = Post.new
  end

  def create_post
    @post = Post.new
    @post.name = params[:post][:name]
    @post.description = params[:post][:description]
    @post.tags = params[:post][:tags]
    @post.items = params[:post][:items]
    @post.user_id = current_user.id
    @post.user_name = current_user.username
    if @post.valid?
      @post.save
      flash[:notice] = 'Post created.'
      redirect_to :root
    else
      render :action => "new_post"
    end
  end
end

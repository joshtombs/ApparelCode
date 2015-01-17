class PostController < ApplicationController
  def new_post
    @post = Post.new
  end

  def create_post
    @post = Post.new
    @post.name = params[:post][:name]
    @post.description = params[:post][:description]
    @post.tags = params[:post][:tags]
    @post.items = params[:post][:items]
    @post.user_id = current_user.id
    if @post.valid?
      @post.save
      flash[:notice] = 'Post created.'
      redirect_to :root
    else
      render :action => "new_post"
    end
  end
end

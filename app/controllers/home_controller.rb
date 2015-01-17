class HomeController < ApplicationController
  def index
    @posts = Post.all
  end

  def people
    @users = User.all
  end
end

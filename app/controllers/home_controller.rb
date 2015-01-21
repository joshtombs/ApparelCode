class HomeController < ApplicationController
  def index
    @user = User.new
    @posts = Post.all
  end

  def people
    @user = User.new
    @users = User.all
  end
end

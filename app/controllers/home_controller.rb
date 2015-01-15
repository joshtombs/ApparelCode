class HomeController < ApplicationController
  def people
    @users = User.all
  end
end

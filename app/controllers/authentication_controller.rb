class AuthenticationController < ApplicationController
  def sign_in
    @user = User.new
  end

  def login
    @user = User.new
    username_or_email = params[:user][:username]
    password = params[:user][:password]

    if username_or_email.rindex('@')
      email=username_or_email
      user = User.authenticate_by_email(email, password)
    else
      username=username_or_email
      user = User.authenticate_by_username(username, password)
    end

    if user
      redirect_to :root
    else
      #sign in failed
      render :action => "sign_in"
    end

  end
end

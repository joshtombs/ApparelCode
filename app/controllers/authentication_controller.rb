class AuthenticationController < ApplicationController
  def sign_in
    @user = User.new
  end

  def signed_out
    session[:user_id] = nil
    flash[:notice] = "You have been signed out."
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
      session[:user_id] = user.id
      flash[:notice] = 'Welcome!'
      redirect_to :root
    else
      #sign in failed
      flash[:error] = "Sign in failed. Please check username/password combination."
      render :action => "sign_in"
    end

  end
end
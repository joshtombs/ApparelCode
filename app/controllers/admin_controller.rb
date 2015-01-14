class AdminController < ApplicationController
  def users
    @users = User.all
  end

  def sign_in
    @admin = Admin.new
  end

  def login
    @admin = Admin.new
    username_or_email = params[:admin][:username]
    password = params[:admin][:password]

    if username_or_email.rindex('@')
      email = username_or_email
      admin = Admin.authenticate_by_email(email, password)
    else
      username = username_or_email
      admin = Admin.authenticate_by_username(username, password)
    end

    if admin
      admin.save
      session[:admin_id] = admin.id
      flash[:notice] = 'Welcome!'
      redirect_to :root
    else
      #sign in failed
      flash[:error] = "Sign in failed. Please check username/password combination."
      render :action => "sign_in"
    end
  end

  def signed_out
    session[:admin_id] = nil
    flash[:notice] = "You have been signed out."
  end

  def current_admin
    @current_admin ||= Admin.find_by_id(session[:admin_id]) if session[:admin_id]
    @current_admin
  end
end

class AdminController < ApplicationController
  before_filter :check_signed_in, only: [:sign_in]
  before_filter :ensure_signed_in, only: [:account_settings, :signed_out, :users]

  def check_signed_in
    redirect_to :root unless !!session[:admin_id].nil?
  end

  def ensure_signed_in
    redirect_to admin_sign_in_path unless !session[:admin_id].nil?
  end

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

  def account_settings
    @admin = current_admin
  end

  def set_account_info
    old_admin = current_admin

    # verify the current password by creating a new user record.
    @admin = Admin.authenticate_by_username(old_admin.username, params[:admin][:password])

    # verify
    if @admin.nil?
      @admin = current_admin
      @admin.errors[:password] = "Password is incorrect."
      render :action => "account_settings"
    else
      # update the user with any new username and email
      @admin.username = params[:admin][:username]
      @admin.email = params[:admin][:email]
      @admin.new_password = params[:admin][:new_password]
      @admin.new_password_confirmation = params[:admin][:new_password_confirmation]
      # Set the old email and username, which is validated only if it has changed.
      @admin.previous_email = old_admin.email
      @admin.previous_username = old_admin.username

      if @admin.valid?
        # If there is a new_password value, then we need to update the password.
        @admin.password = @admin.new_password unless @admin.new_password.nil? || @admin.new_password.empty?
        @admin.save
        flash[:notice] = 'Account settings have been changed.'
        redirect_to :root
      else
        render :action => "account_settings"
      end
    end
  end

  def current_admin
    @current_admin ||= Admin.find_by_id(session[:admin_id]) if session[:admin_id]
    @current_admin
  end

  def users
    @users = User.all
  end

  def delete_user
    User.find_by_id(params[:id]).delete
    @users = User.all
    render :action => :users
  end
end

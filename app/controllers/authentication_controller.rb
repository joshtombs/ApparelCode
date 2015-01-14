class AuthenticationController < ApplicationController
  before_filter :check_signed_in, only: [:sign_in, :new_user]
  before_filter :ensure_signed_in, only: [:account_settings]

  def check_signed_in
    redirect_to :root unless !!session[:user_id].nil?
  end

  def ensure_signed_in
    redirect_to :root unless !session[:user_id].nil?
  end

  def sign_in
    @user = User.new
  end

  def signed_out
    user = User.find_by_id(session[:user_id])
    if user
      update_authentication_token(user, nil)
      user.save
      session[:user_id] = nil
      flash[:notice] = "You have been signed out."
    else
      redirect_to :sign_in
    end
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
      update_authentication_token(user, params[:user][:remember_me])
      user.save
      session[:user_id] = user.id
      flash[:notice] = 'Welcome!'
      redirect_to :root
    else
      #sign in failed
      flash[:error] = "Sign in failed. Please check username/password combination."
      render :action => "sign_in"
    end
  end

  def new_user
    @user = User.new
  end

  def register
    @user = User.new
    @user.username = params[:user][:username]
    @user.email = params[:user][:email]
    @user.password = params[:user][:password]
    @user.password_confirmation = params[:user][:password_confirmation]

    if @user.valid?
      update_authentication_token(@user, nil)
      @user.save
      UserMailer.welcome_email(@user).deliver
      session[:user_id] = @user.id
      flash[:notice] = 'Welcome.'
      redirect_to :root
    else
      render :action => "new_user"
    end
  end

  def update_authentication_token(user, remember_me)
    if remember_me == 1
      # create an authentication token if the user has clicked on remember me
      auth_token = SecureRandom.urlsafe_base64
      user.authentication_token = auth_token
      cookies.permanent[:auth_token] = auth_token
    else # nil or 0
      # if not, clear the token, as the user doesn't want to be remembered.
      user.authentication_token = nil
      cookies.permanent[:auth_token] = nil
    end
  end

  def current_user
    # Note: we want to use "find_by_id" because it's OK to return a nil.
    # If we were to use User.find, it would throw an exception if the user can't be found.
    @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
    @current_user ||= User.find_by_authentication_token(cookies[:auth_token]) if cookies[:auth_token] && @current_user.nil?
    @current_user
  end

  def account_settings
    @user = current_user
  end

  def set_account_info
    old_user = current_user

    # verify the current password by creating a new user record.
    @user = User.authenticate_by_username(old_user.username, params[:user][:password])

    # verify
    if @user.nil?
      @user = current_user
      @user.errors[:password] = "Password is incorrect."
      render :action => "account_settings"
    else
      # update the user with any new username and email
      @user.username = params[:user][:username]
      @user.email = params[:user][:email]
      @user.new_password = params[:user][:new_password]
      @user.new_password_confirmation = params[:user][:new_password_confirmation]
      # Set the old email and username, which is validated only if it has changed.
      @user.previous_email = old_user.email
      @user.previous_username = old_user.username

      if @user.valid?
        # If there is a new_password value, then we need to update the password.
        @user.password = @user.new_password unless @user.new_password.nil? || @user.new_password.empty?
        @user.save
        flash[:notice] = 'Account settings have been changed.'
        redirect_to :root
      else
        render :action => "account_settings"
      end
    end
  end

  def forgot_password
    @user = User.new
  end

  def send_password_reset_instructions
    username_or_email = params[:user][:username]

    if username_or_email.rindex('@')
      user = User.find_by_email(username_or_email)
    else
      user = User.find_by_username(username_or_email)
    end

    if user
      user.password_reset_token = SecureRandom.urlsafe_base64
      user.password_expires_after = 24.hours.from_now
      user.save
      UserMailer.reset_password_email(user).deliver
      flash[:notice] = 'Password instructions have been mailed to you. Please check your inbox.'
      redirect_to :sign_in
    else
      @user = User.new
      # put the previous value back.
      @user.username = params[:user][:username]
      @user.errors[:username] = 'is not a registered user.'
      render :action => "forgot_password"
    end
  end

  def password_reset
    token = params.first[0]
    @user = User.find_by_password_reset_token(token)

    if @user.nil?
      flash[:error] = 'You have not requested a password reset.'
      redirect_to :root
      return
    end

    if @user.password_expires_after < DateTime.now
      clear_password_reset(@user)
      @user.save
      flash[:error] = 'Password reset has expired. Please request a new password reset.'
      redirect_to :forgot_password
    end
  end

  def new_password
    username = params[:user][:username]
    @user = User.find_by_username(username)

    if verify_new_password(params[:user])
      @user.password = params[:user][[:new_password]]

      if @user.valid?
        clear_password_reset(@user)
        @user.save
        flash[:notice] = 'Your password has been reset. Please sign in with your new password.'
        redirect_to :sign_in
      else
        render :action => "password_reset"
      end
    else
      @user.errors[:new_password] = 'Cannot be blank and must match the password verification.'
      render :action => "password_reset"
    end
  end

  private

  def clear_password_reset(user)
    user.password_expires_after = nil
    user.password_reset_token = nil
  end

  def verify_new_password(passwords)
    result = true

    if passwords[:new_password].blank? || (passwords[:new_password] != passwords[:new_password_confirmation])
      result = false
    end

    result
  end
end

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception
  helper_method :current_user
  helper_method :current_admin
  respond_to :html, :json

  def current_user
    @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
    render json: @current_user
  end

  def current_admin
    @current_admin ||= Admin.find_by_id(session[:admin_id]) if session[:admin_id]
    render json: @current_admin
  end
end

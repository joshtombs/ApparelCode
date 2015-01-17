class User < ActiveRecord::Base
  # attr_accessible :email, :username, :password, :password_confirmation
  attr_accessor :password, :new_password, :previous_email, :previous_username, :remember_me
  before_save :encrypt_password
  has_many :posts

  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_presence_of :email, :on => :create
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  validates_presence_of :username, :on => :create
  validates_uniqueness_of :email
  validates_uniqueness_of :username
  validates_presence_of :country, :on => :create
  validates_presence_of :city, :on => :create
  validates_presence_of :age, :on => :create
  validates_presence_of :title, :on => :create

  ####Validations for Account settings
  validates_confirmation_of :new_password, :if => Proc.new {|user| !user.new_password.nil? && !user.new_password.empty? }
  validates_presence_of :email, :if => Proc.new {|user|
    user.previous_email.nil? || user.email != user.previous_email}
  validates_presence_of :username, :if => Proc.new {|user|
    user.previous_username.nil? || user.username != user.previous_username}
  validates_uniqueness_of :email, :if => Proc.new {|user|
    user.previous_email.nil? || user.email != user.previous_email}
  validates_uniqueness_of :username, :if => Proc.new {|user|
    user.previous_username.nil? || user.username != user.previous_username}
  ####

  def self.authenticate(email, password)
    user = find_by_email(email)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end

  def self.authenticate_by_email(email, password)
    user = find_by_email(email)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end

  def self.authenticate_by_username(username, password)
    user = find_by_username(username)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end

  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation, :new_password, :new_password_confirmation, :remember_me, :age, :country, :city, :title)
  end
end

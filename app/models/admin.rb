class Admin < ActiveRecord::Base
  # attr_accessible :email, :username, :password, :password_confirmation
  attr_accessor :password, :new_password, :previous_email, :previous_username
  before_save :encrypt_password

  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_presence_of :email, :on => :create
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  validates_presence_of :username, :on => :create
  validates_uniqueness_of :email
  validates_uniqueness_of :username

  ####Validations for Account settings
  validates_confirmation_of :new_password, :if => Proc.new {|admin| !admin.new_password.nil? && !admin.new_password.empty? }
  validates_presence_of :email, :if => Proc.new {|admin|
    admin.previous_email.nil? || admin.email != admin.previous_email}
  validates_presence_of :username, :if => Proc.new {|admin|
    admin.previous_username.nil? || admin.username != admin.previous_username}
  validates_uniqueness_of :email, :if => Proc.new {|admin|
    admin.previous_email.nil? || admin.email != admin.previous_email}
  validates_uniqueness_of :username, :if => Proc.new {|admin|
    admin.previous_username.nil? || admin.username != admin.previous_username}
  ####

  def self.authenticate(email, password)
    admin = find_by_email(email)
    if admin && admin.password_hash == BCrypt::Engine.hash_secret(password, admin.password_salt)
      admin
    else
      nil
    end
  end

  def self.authenticate_by_email(email, password)
    admin = find_by_email(email)
    if admin && admin.password_hash == BCrypt::Engine.hash_secret(password, admin.password_salt)
      admin
    else
      nil
    end
  end

  def self.authenticate_by_username(username, password)
    admin = find_by_username(username)
    if admin && admin.password_hash == BCrypt::Engine.hash_secret(password, admin.password_salt)
      admin
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
    params.require(:admin).permit(:username, :email, :password, :password_confirmation, :new_password, :new_password_confirmation)
  end
end

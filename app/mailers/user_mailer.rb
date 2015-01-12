class UserMailer < ActionMailer::Base
  default from: 'apparelcode@gmail.com'

  def welcome_email(user)
    @user = user
    @url = 'http://localhost:3000/sign_in'
    @site_name = "localhost"
    mail(:to => user.email, :subject => 'Welcome to my website.')
  end
end

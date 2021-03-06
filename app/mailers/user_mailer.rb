class UserMailer < ApplicationMailer
  default from: "patchcordteam@gmail.com"

  def welcome_email(user)
    @user = user
    mail(to: @user.email, subject: "Thanks for joining!")
  end

  def user_email(user, from_user)
    @user = user
    @from_user = from_user
    mail(to: @user.email, subject: 'Someone wants to jam!')
  end
end

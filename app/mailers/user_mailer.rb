class UserMailer < ApplicationMailer
  default from: "from@example.com"

  def musician_email(user)
    @user = user
    mail(to: @user.email, subject: 'Someone wants to jam!')
  end
end

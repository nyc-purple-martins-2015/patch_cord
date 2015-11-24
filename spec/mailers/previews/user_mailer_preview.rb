# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview

  def musician_email_preview
    UserMailer.musician_email(User.first)
  end

end

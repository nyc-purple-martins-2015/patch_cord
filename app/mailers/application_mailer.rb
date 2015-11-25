class ApplicationMailer < ActionMailer::Base
  include ApplicationHelper
  default from: "patchcordapp@gmail.com"
  layout 'mailer'

  add_template_helper(ApplicationHelper)


  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end
end

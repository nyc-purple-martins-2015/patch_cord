class SessionsController < ApplicationController

  def new
  end

  def create
    auth = request.env['omniauth.auth']
    user = User.find_or_create_by(provider: auth[:provider], uid: auth[:uid])
    user.username = auth[:info][:name]
    if user.new_record?
      user.password = SecureRandom.uuid()
      user.phone = '122345689'
      byebug
      user.save!
    end
    session[:user_id] = user.id
    redirect_to root_path
  end

  def destroy
    session.clear
    redirect_to root_path, notice: "Signed Out"
  end
end

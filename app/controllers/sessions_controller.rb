class SessionsController < ApplicationController

  def new

  end

  def create
    ap request.env['omniauth.auth']
    auth = request.env['omniauth.auth']
    user = User.find_or_create_by(provider: auth[:provider], uid: auth[:uid])
    user.username = auth[:info][:name]
    user.email =  auth[:info][:email]
    if user.new_record?
      user.password = SecureRandom.uuid()
      user.phone = '1234567890'
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

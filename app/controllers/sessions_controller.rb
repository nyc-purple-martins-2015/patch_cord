class SessionsController < ApplicationController

  def new

  end

  def create
    ap request.env['omniauth.auth']
    auth = request.env['omniauth.auth']
    session[:omniauth] =  auth.except('extra')
    user = Authentication.create_with_omniauth(auth)
    session[:user_id] = user.id
    redirect_to root_path "SIGNED IN"
  end

  def destroy
    session[:user_id] = nil
    session[:omniauth] = nil
    redirect_to root_path, notice: "Signed Out"
  end
end

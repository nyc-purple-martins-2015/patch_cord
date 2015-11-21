class SessionsController < ApplicationController

  def new

  end

  def create
    auth = request.env['omniauth.auth']
    # session[:omniauth] =  auth.except('extra')
    @authentication = Authentication.find_or_create_with_omniauth(auth)

    @authentication.user = current_user
    @authentication.save
    redirect_to root_path, notice: "SIGNED IN"
  end

  def destroy
    session[:user_id] = nil
    session[:omniauth] = nil
    redirect_to root_path, notice: "Signed Out"
  end
end

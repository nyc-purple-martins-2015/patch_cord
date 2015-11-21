class SessionsController < ApplicationController

  def new

  end

  def create
    auth = request.env['omniauth.auth']
    # session[:omniauth] =  auth.except('extra')
    @authentication = Authentication.find_with_omniauth(auth)

    if @authentication.nil?
     @authentication = Authentication.create_with_omniauth(auth)
    end

    if logged_in?
      if @authentication.user == current_user
        redirect_to root_path, notice: "SIGNED IN"
      else
        @authentication.user = session[:user_id]
        @authentication.save
        redirect_to root_path, notice: "SIGNED IN"
      end
     else
       if @authentication.user.present?
         self.current_user = @authentication.user
        redirect_to root_path, notice: "SIGNED IN"
       else
        render :new
      end
    end
  end

  def destroy
    session[:user_id] = nil
    session[:omniauth] = nil
    redirect_to root_path, notice: "Signed Out"
  end
end

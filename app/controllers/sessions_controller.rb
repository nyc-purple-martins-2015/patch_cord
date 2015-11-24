class SessionsController < ApplicationController

  def destroy
    session.clear
    redirect_to root_path, notice: "Signed Out"
  end
end

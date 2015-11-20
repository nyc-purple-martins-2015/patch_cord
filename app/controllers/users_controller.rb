class UsersController < ApplicationController 
	def new 
	end

	def create 
	end

	def edit 
	end

	def update 
	end

	def destroy 
	end

	private 

	def user_params 
		user_params = params.require(:user).permit(:username, :email, :password_digest, :address_line1, :address_line2, :city, :state, :zip, :phone, :bio)
	end 
end 
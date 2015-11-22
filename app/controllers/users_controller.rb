class UsersController < ApplicationController

	def index
		@users = User.all
	end

	def new
	end

	def create
	end

	def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user
      @user.update_attributes(user_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

	def destroy
    @user.destroy
    redirect_to root_path
	end

	def search
		genre_ids = params["Genre"].map {|e| e[0].to_i}
		genres = Genre.find(genre_ids)
		genres_with_musicians = genres.select {|genre| !genre.users.empty?}
		@musicians = genres_with_musicians.flat_map {|genre| genre.users}
		@instruments = Instrument.all
		render "users/_musicians-instruments"
	end

	private

	def user_params
		user_params = params.require(:user).permit(:username, :email, :password_digest, :address_line1, :address_line2, :city, :state, :zip, :phone, :bio)
	end
end

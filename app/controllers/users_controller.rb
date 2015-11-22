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
		if params["Genre"]
			genre_ids = params["Genre"].map {|e| e[0].to_i}
			genres = Genre.find(genre_ids)
			genres_with_musicians = genres.select {|genre| !genre.users.empty?}
			if genres_with_musicians.count > 1
			@musicians = genres_with_musicians.flat_map {|genre| genre.users}.uniq
			else
			@musicians = genres_with_musicians.map {|genre| genre.users}.flatten
			end
			@musicians_ids = @musicians.map {|musician| musician.id}
			@instruments = Instrument.all
			render "users/_musicians-instruments", layout: false
		elsif params["Instrument"]
			musicians_ids = params["musicians"].split(" ").map {|e| e.to_i}
			@original_musicians = User.find(musicians_ids)
			instrument_ids = params["Instrument"].map {|e| e[0].to_i}
			instruments = Instrument.find(instrument_ids)
			instruments_with_musicians = instruments.select {|instrument| !instrument.users.empty?}
			if instruments_with_musicians.count > 1
			@musicians = instruments_with_musicians.flat_map {|instrument| instrument.users}.uniq
			else
			@musicians = instruments_with_musicians.map {|instrument| instrument.users}.flatten
			end
			@musicians = @original_musicians & @musicians
			render "users/musicians_sorted", layout: false
		end
	end

	private

	def user_params
		user_params = params.require(:user).permit(:username, :email, :password_digest, :address_line1, :address_line2, :city, :state, :zip, :phone, :bio)
	end
end

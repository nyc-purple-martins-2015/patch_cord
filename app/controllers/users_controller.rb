class UsersController < ApplicationController

	def index
		@users = User.all
	end

	def new
		@user = User.new
	end

	def create
		auth = request.env['omniauth.auth']
    @user = User.validate_via_provider(auth)
    @genres = Genre.pluck(:name)
    if @user
      session[:user_id] = @user.id
      if @user.has_instruments?
      	redirect_to user_path(@user)
      else
      	render :new
      end
    else
      redirect_to root_path
    end
	end

	def show
		@user = User.find(params[:id])
	end

	def edit
		@user = User.find(params[:id])
		@genres = Genre.pluck(:name)
	end

	def update
		@user = User.find(params[:id])

		if @user.save
			if params.has_key?("genre_types")
				@user.genres = []
				@genres = params[:genre_types]
				@genres.each do |genre|
					@user.genres << Genre.find_or_create_by(name: genre.strip)
				end
			else
				@user.genres.delete_all
			end

			@instruments = params[:user][:instruments].split(",")
			if @instruments.any?
				@instruments.each do |instrument|
					unless @user.instruments.map(&:name).include?(instrument)
						@user.instruments << Instrument.find_or_create_by(name: instrument.strip)
					end
				end
			end


				@user.update_attributes(user_params)
				@user.lat_long
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
			@musicians_ids = @musicians.map {|musician| musician.id}
			render "users/_musicians-location", layout: false
		elsif params["Distance"]
			musicians_ids = params["musicians"].split(" ").map {|e| e.to_i}
			original_musicians = User.find(musicians_ids)
			user_location = [current_user.latitude, current_user.longitude]
			distance = params["Distance"][0].to_i
			all_musicians_near = User.within(distance, :origin => user_location)
			@musicians = original_musicians & all_musicians_near
			render "users/_musicians-sorted", layout: false
		end

	end

	private

	def user_params
		user_params = params.require(:user).permit(:username, :email, :password_digest, :address_line1, :address_line2, :city, :state, :zip, :phone, :bio)
	end
end

class UsersController < ApplicationController

	def index
		@users = User.all
	end

def new
	@genres = Genre.all
	# This doesn't make sense to me User.new without params would give an 
	# empty user, so city must be nil?
	@user = User.new
	if @user.city == nil
		render :status => 404
	end
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

	def email
		@user = User.find(params[:id])
		UserMailer.user_email(@user, current_user).deliver_now
		flash[:notice] = "Your email has been sent!"
		redirect_to user_path(@user)
	end

	def edit
		@user = User.find(params[:id])
		@genres = Genre.pluck(:name)
	end

  # This action is doing too much - it would be good to  pull out the various sections 
  #  into logical groups and put them in private methods
  #  Then the update action can  "tell a story" like 
  #  user = User.find(...)
  #  set_user_genres
  #  set_user_instruments
  #  user.save
  #  or whatever makes sense in your case.

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
				if @user.email
					UserMailer.welcome_email(@user).deliver_now
				end

				# This line isn't doing anything?
				@user.lat_long
				redirect_to user_path(@user)
			else
				render :edit
			end
		end

	def destroy
		@user = User.find(params[:id])
		@user.destroy
		session[:user_id] = nil
		redirect_to root_path
	end
 
  # Again - this action is way too big. Pull out the ifs into a set of method calls.
  # 
	def search
		if params["Genre"]
			genre_ids = params["Genre"].map {|e| e[0].to_i}
			genres = Genre.find(genre_ids)
			# You could replace this if / else /end  section with some ActiveRecord calls I think
			# It would be more efficient but more importantly more readable
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
      @map_string = "https://maps.googleapis.com/maps/api/staticmap?size=600x300&maptype=roadmap" + @musicians.map {|musician| musician.map_string}.join("") + "&key=AIzaSyDbL6SGxiaR5BjXdzLPJHxQyjIAhoBVz_o"
			render "users/_musicians-sorted", layout: false
		end

	end

	private

	def user_params
		user_params = params.require(:user).permit(:username, :email, :password_digest, :address_line1, :address_line2, :city, :state, :zip, :phone, :bio)
	end
end

class GenresController < ApplicationController
	def new
		@genre = Genre.new
	end

	def create
		@user = current_user
		@genres = Genre.all
		# You should use activerecord here to find the genre
		# rather than loading all of them and filtering in ruby.
		if @genres.any? {|genre| genre.name = params[:genre][:name]}
			redirect_to root_path
		end
		@genre = @user.genres.new(genre_params)
		if @genre.save
			redirect_to root_path
		else
			render :new
		end
	end

	def show
	end

	def destroy
		@user = current_user
		# This is odd - you are loading instruments into a
		# variable called @genre
		@genre = @genre.instruments.find(params[:id])
		@genre.destroy
		redirect_to root_path
	end

	private

	def genre_params
		genre_params = params.require(:genre).permit(:name)
	end
end

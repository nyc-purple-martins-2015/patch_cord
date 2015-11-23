class GenresController < ApplicationController
	def new
		@genre = Genre.new
	end

	def create
		@user = current_user
    # This is using Ruby when SQL would be better.
    # You could use find_by or where to find the count of things that match and
    # make this decision much faster.
		@genres = Genre.all
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
		@genre = @genre.instruments.find(params[:id])
		@genre.destroy
		redirect_to root_path
	end

	private

	def genre_params
		genre_params = params.require(:genre).permit(:name)
	end
end

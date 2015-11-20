class GenresController < ApplicationController
	def new 
	end

	def create 
	end

	def show
	end 

	def destroy 
	end

	private 

	def genre_params 
		genre_params = params.require(:genre).permit(:name)
	end 
end 
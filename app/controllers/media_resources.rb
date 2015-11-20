class MediaResourcesController < ApplicationController
	def new 
	end

	def create 
	end

	def edit 
	end 

	def update 
	end

	def show
	end 

	def destroy 
	end

	private 

	def media_resources_params 
		media_resources_params = params.require(:media_resources).permit(:media_type, :content, :link)
	end 
end 
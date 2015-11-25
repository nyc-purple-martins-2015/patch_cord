class MediaResourcesController < ApplicationController

	def new
	end

	def create
		current_user.media_resources.create(media_resources_params)
			redirect_to user_path(current_user)
	end

	def edit
	end

	def update
	end

	def show
	end

	def destroy
    @media_resource = MediaResource.find(params[:id])
    @media_resource.destroy
    redirect_to user_path(current_user)
	end

def addresource
	render :'_musicians-add-media-resources', layout: false
end

	private

	def media_resources_params
		media_resources_params = params.require(:media_resources).permit(:media_type, :content, :link)
	end
end

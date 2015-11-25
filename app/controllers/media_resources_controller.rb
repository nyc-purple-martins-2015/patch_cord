class MediaResourcesController < ApplicationController

	def new
    if params[:user_id]
      @showable_type = "User"
      @showable_id = params[:user_id]
    elsif params[:band_id]
      @showable_type = "Band"
      @showable_id = params[:band_id]
    end
	end

	def create
    puts params
    if params[:media_resources][:showable_type] == "User"
  		mr = MediaResource.new(media_resources_params)
  		mr.showable = current_user
      mr.save!
      redirect_to user_path(current_user)
    elsif params[:media_resources][:showable_type] == "Band"
      MediaResource.create!(media_resources_params)
      redirect_to band_path(params[:media_resources][:showable_id])
    end
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
		media_resources_params = params.require(:media_resources).permit(:media_type, :content, :link, :showable_id, :showable_type)
	end
end

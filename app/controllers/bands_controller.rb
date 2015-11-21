class BandsController < ApplicationController

	def index
    @bands = Band.all
  end

  def show
    @band = Band.find(params[:id]) #are these params right?
  end

  def new
    @band = Band.new
	end

	def create
    @user = current_user
    @band = @user.bands.create(band_params)
	end

	def edit
	end

	def update
	end

	def destroy
	end

	private

	def band_params
		band_params = params.require(:band).permit(:name, :bio, :admin_id)
	end
end

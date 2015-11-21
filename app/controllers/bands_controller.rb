class BandsController < ApplicationController

	def index
    @bands = Band.all
  end

  def show
    # @band = Band.find(params[:id]) #are these params right?
  end

  def new
    @band = Band.new
	end

	def create
    @band = current_user.bands.new(band_params)
    if @band.save
      redirect_to @band
    else
      status 400
      render :new
    end
	end

	def edit
	end

	def update
	end

	def destroy
	end

  def search
    render :bands_search_path
  end

	private

	def band_params
		band_params = params.require(:band).permit(:name, :bio, :admin_id)
	end
end

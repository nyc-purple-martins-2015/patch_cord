class BandsController < ApplicationController

	def index
    @bands = Band.all
  end

  def show
    @band = Band.find(params[:id])
    #are these params right?
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
    @band = Band.find(params[:id])
  end

  def update
    @band = Band.find(params[:id])
    if @band
      @band.update_attributes(band_params)
      redirect_to band_path(@band)
    else
      render :edit
    end
	end

	def destroy
    if @band.destroy
      redirect_to root_path
    else
      @errors = @band.errors.full_messages
    end
	end

  def search
    render :bands_search_path
  end

	private

	def band_params
		band_params = params.require(:band).permit(:name, :bio, :admin_id)
	end
end

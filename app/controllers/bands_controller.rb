class BandsController < ApplicationController

	def index
    @bands = Band.all
  end

  def show

  end

  def new
    @band = Band.new
	end

	def create
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

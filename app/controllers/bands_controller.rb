class BandsController < ApplicationController

	def index
    @bands = Band.all
  end

  def show
    @band = Band.find(params[:id])
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

    if @band.save
      if params.has_key?("genre_types")
        @genres = params[:genre_types]
        @genres.each do |genre|
          unless @user.genres.map(&:name).include?(genre)
          @user.genres << Genre.find_or_create_by(name: genre.strip)
          end
        end
      end

      @instruments = params[:user][:instruments].split(",")
      if @instruments.any?
        @instruments.each do |instrument|
          unless @user.instruments.map(&:name).include?(instrument)
          @user.instruments << Instrument.find_or_create_by(name: instrument.strip)
          end
        end
      end

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
    genre_ids = params["Genre"].map {|e| e[0].to_i}
    genres = Genre.find(genre_ids)
    genres_with_bands = genres.select {|genre| !genre.bands.empty?}
    bands_from_genre = genres_with_bands.map {|genre| genre.bands}.flatten
    band_ids = bands_from_genre.map {|band| band.id}
    @bands = Band.find(band_ids)
    render "bands/_bands-sorted", layout: false
  end

	private

	def band_params
		band_params = params.require(:band).permit(:name, :bio, :admin_id)
	end
end

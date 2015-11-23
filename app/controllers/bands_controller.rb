class BandsController < ApplicationController

	def index
    @bands = Band.all
  end

  def new
    @band = Band.new
  end

  def create
    @band = current_user.bands.new(band_params)
    if @band.save
      redirect_to @band
    else
      render :new
    end
  end

  def show
    @band = Band.find(params[:id])
  end

  # This method is too long, it's probably doing too much
  # # TODO
  def update
    @band = Band.find(params[:id])
    if @band
      @band.update_attributes(band_params)
      @members = @band.users

      if @band.save
        new_admin = params[:band][:admin_name]
        @band.admin = User.find_or_create_by(username: new_admin.strip)

        if params.has_key?("genre_types")
          @genres = params[:genre_types]
          @genres.each do |genre|
            # User SQL.
            unless @band.genres.map(&:name).include?(genre)
              @band.genres << Genre.find_or_create_by(name: genre.strip)
            end
          end
        end

        new_members = params[:band][:members].split(",")
        if new_members.any?
          new_members.each do |member|
            unless @members.map(&:username).include?(member)
              @members << User.find_or_create_by(username: member.strip)
            end
          end
        end

        @band.update_attributes(band_params)
        redirect_to band_path(@band)
      else
        render :edit
      end
    end
  end


def edit
 @band = Band.find(params[:id])
 @genres = Genre.pluck(:name)
end

 def destroy
   if @band.destroy
     redirect_to root_path
   else
     @errors = @band.errors.full_messages
   end
 end

 # TODO
 def search
  genre_ids = params["Genre"].map {|e| e[0].to_i}
  genres = Genre.find(genre_ids)
  genres_with_bands = genres.select {|genre| !genre.bands.empty?}
  bands_from_genre = genres_with_bands.map {|genre| genre.bands}.flatten
  band_ids = bands_from_genre.map {|band| band.id}
  @bands = Band.find(band_ids)
  render :"bands/_bands-sorted", layout: false
end

  private

    def band_params
      band_params = params.require(:band).permit(:name, :bio, :admin_id)
    end
end

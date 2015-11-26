class BandsController < ApplicationController

	def index
    @bands = Band.all
  end

  def new
    @band = Band.new
    @genres = Genre.pluck(:name)
  end

  def create
    @band = Band.new(band_params)
    @genres = Genre.pluck(:name)
    new_members = params[:band][:members].split(",")


    if @band.valid? && @band.save
      admin = params[:band][:admin]
      admin_id = User.find_by(username: admin).id
      @band.update_attributes(admin_id: admin_id)

      if params[:genre_types]
        @band_genres = params[:genre_types]
        @band_genres.each { |genre| @band.genres << Genre.find_by(name: genre.strip) }
      end

      if new_members.any?
        new_members.each { |member| @band.users << User.find_by(username: member.strip) }
      end

      @band.update_attributes(band_params)

      redirect_to root_path
    else
      flash[:errors] = @band.errors.full_messages
      redirect_to new_band_path
    end
  end

  def show
    @band = Band.find(params[:id])
    @band_admin = User.find(@band.admin_id)
  end

  def edit
    @band = Band.find(params[:id])
    @genres = Genre.pluck(:name)
  end

  def update
   @band = Band.find(params[:id])

   if @band.save
    new_admin = params[:band][:admin_name]
    @band.admin = User.find_or_create_by(username: new_admin.strip)

    if params.has_key?("genre_types")
      @genres = params[:genre_types]
      @genres.each do |genre|
        unless @band.genres.map(&:name).include?(genre)
          @band.genres << Genre.find_or_create_by(name: genre.strip)
        end
      end
    else
      @band.genres.delete_all
    end
  end

  new_members = params[:band][:members].split(",")

  if new_members.any?
    new_members.each do |member|
      unless @band.users.map(&:username).include?(member)
        @band.users << User.find_or_create_by(username: member.strip)
      end
    end
  end

  @band.update_attributes(band_params)
  redirect_to band_path(@band)
end

def edit
 @band = Band.find(params[:id])
 @genres = Genre.pluck(:name)
end

def destroy
  @band = Band.find(params[:id])

  if @band && params[:member]
    UserBand.find_by(user_id: params[:member]).destroy
    redirect_to band_path(@band)
  elsif @band
    @band.destroy
    redirect_to root_path
  else
    @errors = @band.errors.full_messages
  end
end

def search
  if params["Genre"]
    genre_ids = params["Genre"].map {|e| e[0].to_i}
    genres = Genre.find(genre_ids)
    genres_with_bands = genres.select {|genre| !genre.bands.empty?}
    bands_from_genre = genres_with_bands.map {|genre| genre.bands}.flatten
    band_ids = bands_from_genre.map {|band| band.id}
    @bands = Band.find(band_ids)
    @bands_ids = @bands.map {|band| band.id}
    render :"bands/_bands-location", layout: false
  elsif params["Distance"]
    bands_ids = params["bands"].split(" ").map {|e| e.to_i}
    original_bands = Band.find(bands_ids)
    user_location = [current_user.latitude, current_user.longitude]
    distance = params["Distance"][0].to_i
    all_bands_near = Band.within(distance, :origin => user_location)
    @bands = original_bands & all_bands_near
    @map_string = "https://maps.googleapis.com/maps/api/staticmap?size=600x300&maptype=roadmap" + @bands.map {|band| band.map_string}.join("") + "&key=AIzaSyDbL6SGxiaR5BjXdzLPJHxQyjIAhoBVz_o"
    render :"bands/_bands-sorted", layout: false
  end
end

def mediaresources
  @band = Band.find(params[:id])
  render partial:'band_media_resources', locals: {band: @band}
end

private

def band_params
  band_params = params.require(:band).permit(:name, :bio)
end
end

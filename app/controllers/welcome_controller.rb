class WelcomeController < ApplicationController

  def index
    @musicians = User.all
    @bands = Band.all
    @instruments = Instrument.all
    @genres = Genre.all
  end

  def search
    if params[:group] == 'Musicians'
      @musicians = User.all
      @genres = Genre.all
      render "users/_musicians", layout: false
    elsif params[:genre] && params[:group] == "Bands"
      @genre = Genre.find_by(name: params[:genre])
      @bands = @genre.bands
      binding.pry
      render "bands/_bands-sorted", layout: false
    elsif params[:group] == 'Bands'
      @bands = Band.all
      @genres = Genre.all
      render "bands/_bands", layout: false
    elsif params[:genre] && params[:group] == "Musicians"
      @genre = Genre.find_by(name: params[:genre])
      binding.pry
      @musicians = @genre.users
      render "users/_musicians-sorted"
    end


  end

end

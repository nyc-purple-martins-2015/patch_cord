class WelcomeController < ApplicationController

  def index
    @musicians = User.all
    @bands = Band.all
    @instruments = Instrument.all
    @genres = Genre.all
  end

  def edit
    @user = User.find(params[:id])
    @genres = Genre.pluck(:name)
  end

  def search
    if params[:group] == 'Musicians'
      @musicians = User.all
      @genres = Genre.all
      @instruments = Instrument.all
      render "users/_musicians", layout: false
    elsif params[:genre] && params[:group] == "Bands"
      @genre = Genre.find_by(name: params[:genre])
      @bands = @genre.bands
      render "bands/_bands-sorted", layout: false
    elsif params[:genre] && params[:group] == "Musicians"
      @genre = Genre.find_by(name: params[:genre])
      @musicians = @genre.users
      render "users/_musicians-sorted"
    elsif params[:group] == 'Bands'
      @bands = Band.all
      @genres = Genre.all
      render "bands/_bands", layout: false
    end
  end

end

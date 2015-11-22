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
      render "users/_musicians-genre", layout: false
    else
      @bands = Band.all
      @genres = Genre.all
      render "bands/_bands-genre", layout: false
    end
  end

end

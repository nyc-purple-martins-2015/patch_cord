class WelcomeController < ApplicationController
  def index
    @instruments = Instruments.all
    @genres = Genres.all
  end
end

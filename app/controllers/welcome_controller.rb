class WelcomeController < ApplicationController
  def index
    @instruments = Instrument.all
    @genres = Genre.all
  end
end

class WelcomeController < ApplicationController
  def index
  end

  def search
    @instruments = Instrument.all
    @genres = Genre.all
    if params[:type] == 'musicians'
      render :'musician_search'
    else
      render :'band_search'
    end
  end

end

class WelcomeController < ApplicationController
  def index
    @instruments = Instruments.all
  end
end

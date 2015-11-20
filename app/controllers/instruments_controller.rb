class InstrumentsController < ApplicationController
	def new 
		@instrument = Instrument.new
	end

	def create 
	end

	def show
	end 

	def destroy 
	end

	private 

	def instrument_params 
		instrument_params = params.require(:instrument).permit(:name)
	end 
end 
class InstrumentsController < ApplicationController
	
	def new 
		@instrument = Instrument.new
	end

	def create
		@instrument = Instrument.new(instrument_params) 
		if @instrument.save 
			redirect_to root_path 
		else 
			render :new
		end 
	end

	def destroy
		@instrument = Instrument.find(params[:id])
		@instrument.destroy 
		redirect_to root_path
	end

	private 

	def instrument_params 
		instrument_params = params.require(:instrument).permit(:name)
	end

end 
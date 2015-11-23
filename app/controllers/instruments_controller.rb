class InstrumentsController < ApplicationController
	
	def new 
		@instrument = Instrument.new
	end

	def create
		@user = current_user
    # You use the associations well.  Yay.
		@instrument = @user.instruments.new(instrument_params)
		if @instrument.save 
			redirect_to root_path 
		else 
			render :new
		end 
	end

	def destroy
		@user = current_user
		@instrument = @user.instruments.find(params[:id])
		@instrument.destroy 
		redirect_to root_path
	end

	private 

	def instrument_params 
		instrument_params = params.require(:instrument).permit(:name)
	end

end 

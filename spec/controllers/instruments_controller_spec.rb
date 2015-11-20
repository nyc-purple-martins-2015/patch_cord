require 'rails_helper'

describe InstrumentsController do 

	let(:instrument) {Instrument.new}

	it 'is successful' do 
		get :new 
		expect(response).to be_success
	end  

end 
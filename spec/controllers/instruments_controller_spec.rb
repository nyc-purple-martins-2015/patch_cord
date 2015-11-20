require 'rails_helper'

describe InstrumentsController do 

	let(:instrument) {Instrument.new}

	it 'is successful' do 
		get :new 
		expect(response).to be_success
	end  

	it 'creates a new instrument' do 
		get :new 
		expect(@instrument).to be_a_kind_of(Instrument)
	end 

end 
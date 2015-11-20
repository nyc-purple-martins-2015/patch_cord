require 'rails_helper'

describe InstrumentsController do 
	
	before(:each) do 
		user = FactoryGirl.create(:user)
		stub_current_user(user)
		@instrument = FactoryGirl.create(:instrument)
	end 

	context '#new' do 

		it 'is successful' do 
			get :new 
			expect(response).to be_success
		end  

		it 'creates a new instrument' do 
			get :new 
			expect(@instrument).to be_a_kind_of(Instrument)
		end 
	end 

	context '#create' do 
		it 'creates an instrument if params are valid ' do 
			expect {
				post :create, instrument: FactoryGirl.attributes_for(:instrument)}.to change(Instrument, :count).by(1)
		end 
	end 

end 
require 'rails_helper'

describe GenresController do 

	let(:genre) { FactoryGirl.create(:genre) }

	context '#new' do 

		it 'is successful' do 
			get :new 
			expect(response).to be_success
		end  

		it 'creates a new genre' do 
			get :new 
			expect(genre).to be_a_kind_of(Genre)
		end 
	end 

	context '#create' do 
		it 'creates an genre if params are valid ' do 
			expect {
				post :create, genre: FactoryGirl.attributes_for(:genre)}.to change(Instrument, :count).by(1)
		end 
	end 

end 
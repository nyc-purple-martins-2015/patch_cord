require 'rails_helper'

describe GenresController do 

	before(:each) do 
		user = FactoryGirl.create(:user)
		stub_current_user(user)
		@genre = FactoryGirl.create(:genre)
	end 
	
	context '#new' do 

		it 'is successful' do 
			get :new 
			expect(response).to be_success
		end  

		it 'creates a new genre' do 
			get :new 
			expect(@genre).to be_a_kind_of(Genre)
		end 
	end 

	context '#create' do 
		it 'creates a genre if params are valid ' do 
			expect {
				post :create, genre: FactoryGirl.attributes_for(:genre)}.to change(Genre, :count).by(1)
		end 
	end 

end 
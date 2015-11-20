 require 'rails_helper'

describe BandsController do

  before(:each) do
    @band = FactoryGirl.create(:band)
  end

  context "#index" do

    it 'is successful' do
      get :index
      expect(response).to be_success
    end

    it 'returns an array of bands' do
      get :index
      expect(@bands).to be_an(Array)
    end

  end

  context "#new" do

    it 'is successful' do
      get :new
      expect(response).to be_success
    end

    it 'creates a new band' do
      get :new
      expect(@band).to be_a(Band)
    end

  end

  context "#create" do

    xit 'logs in a user' do
      user_hash = {username: @user.username, email: @user.email, password: @user.password}
      post :create, user_hash
      expect(session[:user_id]).to eq @user.id
    end

     xit 'redirects to home page when user logs in' do
      user_hash = {username: @user.username, email: @user.email, password: @user.password}
      post :create, user_hash
      expect(response).to redirect_to(root_path)
    end

    xit 'does not log in an invalid user' do
      user_hash = {username: @user.username, email: @user.email, password: "incorrect"}
      post :create, user_hash
      expect(session[:user_id]).to eq nil
    end

    xit 'redirects to login path when authentication fails' do
      user_hash = {username: @user.username, email: @user.email, password: "incorrect"}
      post :create, user_hash
      expect(response).to redirect_to(login_path)
    end

  end

  context "#destroy" do

    xit 'logs out the user' do
      user_hash = {username: @user.username, email: @user.email, password: @user.password}
      post :create, user_hash
      get :destroy
      expect(session[:user_id]).to eq nil
    end

    xit 'redirects to the home page' do
      user_hash = {username: @user.username, email: @user.email, password: @user.password}
      post :create, user_hash
      get :destroy
      expect(response).to redirect_to(root_path)
    end

  end
end

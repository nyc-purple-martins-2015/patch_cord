 require 'rails_helper'

describe BandsController do

  before(:each) do
    @band = FactoryGirl.create(:band)
  end

  context "#new" do

    it 'is successful' do
      get :new
      expect(response).to be_success
    end

    xit 'creates a new user' do
      get :new
      expect(@user).to be_a_kind_of(User)
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

 require 'rails_helper'

describe SessionsController do

  before(:each) do
    session.clear
    @user = FactoryGirl.create(:user)
  end

  context "#new" do

    it 'is successful' do
      get :new
      expect(response).to be_success
    end

    it 'creates a new user' do
      get :new
      expect(@user).to be_a_kind_of(User)
    end

  end

  context "#create" do

    it 'logs in a user' do
      user_hash = {username: @user.username, email: @user.email, password: @user.password}
      post :create, user_hash
      expect(session[:user_id]).to eq @user.id
    end

     it 'redirects to question path when user logs in' do
      user_hash = {username: @user.username, email: @user.email, password: @user.password}
      post :create, user_hash
      expect(response).to redirect_to(questions_path)
    end

    it 'does not log in an invalid user' do
      user_hash = {username: @user.username, email: @user.email, password: "incorrect"}
      post :create, user_hash
      expect(session[:user_id]).to eq nil
    end

    it 'redirects to login path when authentication fails' do
      user_hash = {username: @user.username, email: @user.email, password: "incorrect"}
      post :create, user_hash
      expect(response).to redirect_to(login_path)
    end

  end

  context "#destroy" do

    it 'logs out the user' do
      user_hash = {username: @user.username, email: @user.email, password: @user.password}
      post :create, user_hash
      get :destroy
      expect(session[:user_id]).to eq nil
    end

    it 'redirects to the questions path' do
      user_hash = {username: @user.username, email: @user.email, password: @user.password}
      post :create, user_hash
      get :destroy
      expect(response).to redirect_to(questions_path)
    end

  end
end

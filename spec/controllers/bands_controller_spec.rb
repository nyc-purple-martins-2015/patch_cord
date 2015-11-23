 require 'rails_helper'

describe BandsController do

  let(:band) {FactoryGirl.create(:band)}
  # We have better methods for this.
  # See:
  #
  # built_users   = build_list(:user, 25)
  # created_users = create_list(:user, 25)
  #
  # https://github.com/thoughtbot/factory_girl/blob/master/GETTING_STARTED.md
  let(:bands) {array = []; 5.times{array << FactoryGirl.create(:band)}; array}
  let(:user) {FactoryGirl.create(:user)}

  before(:each) do
    stub_current_user(user)
  end


  context "#index" do

    it 'is successful' do
      get :index
      expect(response).to be_success
    end

    it 'returns an array of bands' do
      get :index
      expect(bands).to be_an(Array)
      #test for array of band objects
    end

    it 'renders index view' do
      get :index
      expect(response).to render_template("index")
    end

  end

  context "#show" do

    it 'is successful' do
      get :show, id: band.id
      expect(response).to be_success
    end

    it 'returns a band' do
      get :show, id: band.id
      expect(band).to be_a(Band)
    end

    it 'renders show view' do
      get :show, id: band.id
      expect(response).to render_template("show")
    end

  end

  context "#new" do

    it 'is successful' do
      get :new
      expect(response).to be_success
    end

    it 'creates a new band' do
      get :new
      expect(band).to be_a(Band)
    end

    it 'renders new view' do
      get :new
      expect(response).to render_template("new")
    end

  end

  context "#create" do

    it 'creates a band' do
      # FactoryGirl can save some typing with:
      # attrs = attributes_for(:band)
      band_params = {band: {name: "Rock Stars", bio: "We're great", admin_id: 1}}
      post :create, band_params
      created_band = Band.find_by(name: "Rock Stars")
      expect(response).to redirect_to(band_path(created_band))
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

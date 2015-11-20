require 'rails_helper'

RSpec.describe User do
  context 'is a model and has attributes' do

    it "is a valid model" do
      expect(User.new).to be_a(User)
    end

    it 'has a username attribute' do
     expect(User.new).to respond_to(:username)
   end

    it 'has a email attribute' do
     expect(User.new).to respond_to(:email)
   end

   it 'has a password digest attribute' do
     expect(User.new).to respond_to(:password_digest)
   end

   it 'has a address line 1 attribute' do
     expect(User.new).to respond_to(:address_line1)
   end

   it 'has a address line 2 attribute' do
     expect(User.new).to respond_to(:address_line2)
   end

   it 'has a city attribute' do
     expect(User.new).to respond_to(:city)
   end

   it 'has a state attribute' do
     expect(User.new).to respond_to(:state)
   end

   it 'has a zip attribute' do
     expect(User.new).to respond_to(:zip)
   end

    it 'has a phone attribute' do
     expect(User.new).to respond_to(:phone)
   end

    it 'has a bio attribute' do
     expect(User.new).to respond_to(:bio)
   end

  end

  context 'has correct validations and associations' do

    it { should have_secure_password }

    it { should validate_presence_of(:username) }

    it { should validate_uniqueness_of(:username) }

    it { should validate_presence_of(:password_digest) }

    it { should validate_presence_of(:phone) }

    it { should have_many(:instruments) }

    it { should have_many(:genres) }

    it { should have_many(:bands) }

    it { should have_many(:media_resources) }

  end

end

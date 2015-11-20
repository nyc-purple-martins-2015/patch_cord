require 'rails_helper'

RSpec.describe Band do
  context 'is a model and has attributes' do

    it "is a valid model" do
      expect(Band.new).to be_a(Band)
    end

    it 'has a name attribute' do
     expect(Band.new).to respond_to(:name)
   end

    it 'has a bio attribute' do
     expect(Band.new).to respond_to(:bio)
   end

    it 'has an admin id' do
     expect(Band.new).to respond_to(:admin_id)
   end

  end

  context 'has correct validations and associations' do

    it { should validate_presence_of(:name) }

    it { should validate_presence_of(:admin_id) }

    it { should belong_to(:admin) }

    it { should have_many(:media_resources) }

    it { should have_many(:users) }

    it { should have_many(:genres) }

    # it { should have_many(:instruments) } this needs to be fixed in migrations and models.
  end

end

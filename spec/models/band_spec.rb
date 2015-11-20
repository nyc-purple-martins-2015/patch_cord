require 'rails_helper'

RSpec.describe Band do
  context 'is a model and has attributes' do

    it "exists" do
      expect(Band.new).to be_a(Band)
    end

    it 'has a name attribute' do
     expect(Band.new).to respond_to(:name)
   end

    it 'has a bio attributes' do
     expect(Band.new).to respond_to(:bio)
   end

    it 'has an admin id' do
     expect(Band.new).to respond_to(:admin_id)
   end

  end
end

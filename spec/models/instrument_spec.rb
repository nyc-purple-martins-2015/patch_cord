require 'rails_helper'

RSpec.describe Instrument do
  context 'is a model and has attributes' do

    it "is a valid model" do
      expect(Instrument.new).to be_a(Instrument)
    end

    it 'has a name attribute' do
     expect(Instrument.new).to respond_to(:name)
   end

  end

  context 'has correct validations and associations' do

    it { should validate_presence_of(:name) }

    it { should have_many(:users) }

  end

end

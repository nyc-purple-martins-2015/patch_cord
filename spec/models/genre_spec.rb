require 'rails_helper'

RSpec.describe Genre do
  context 'is a model and has attributes' do

    it "is a valid model" do
      expect(Genre.new).to be_a(Genre)
    end

    it 'has a name attribute' do
     expect(Genre.new).to respond_to(:name)
   end

  end

  context 'has correct validations and associations' do

    it { should validate_presence_of(:name) }

    it { should have_many(:bands) }

    it { should have_many(:users) }

  end

end

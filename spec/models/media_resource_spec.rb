require 'rails_helper'

RSpec.describe MediaResource do
  context 'is a model and has attributes' do

    it "is a valid model" do
      expect(MediaResource.new).to be_a(MediaResource)
    end

    it 'has a media type attribute' do
     expect(MediaResource.new).to respond_to(:media_type)
   end

    it 'has a content attribute' do
     expect(MediaResource.new).to respond_to(:content)
   end

    it 'has an link attribute' do
     expect(MediaResource.new).to respond_to(:link)
   end

   it 'has an showable id attribute' do
     expect(MediaResource.new).to respond_to(:showable_id)
   end

    it 'has an showable type attribute' do
     expect(MediaResource.new).to respond_to(:showable_type)
   end

  end

  context 'has correct validations and associations' do

    it { should belong_to(:showable) }

  end

end

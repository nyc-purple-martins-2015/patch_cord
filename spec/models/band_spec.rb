require 'rails_helper'

RSpec.describe Band do
  it "exists" do
    expect(Band.new).to be_a(Band)
  end
end

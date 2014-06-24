require "airport"
require "weather"

describe Weather do

  let(:airport) {Airport.new}

  it "can be sunny" do
    allow(airport).to receive(:stormy?) {false}
    expect(airport).not_to be_stormy

  end

  it "can be stormy" do
    allow(airport).to receive(:stormy?) {true}
    expect(airport).to be_stormy
  end
end


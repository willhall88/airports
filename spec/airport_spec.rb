require "airport"
require "weather"

describe Airport do

  let(:airport) { Airport.new }
  let(:plane  ) { double :plane, land: :plane, takeoff: :plane }

  context "take off and landing" do

    before(:each)do
      allow(airport).to receive(:stormy?) {false}
    end
    
    it "a plane can land" do
      expect(airport.plane_count).to eq 0
      expect(plane).to receive(:land)

      airport.land(plane)

      expect(airport.plane_count).to eq 1
    end

    it "a plane can takeoff" do
      expect(plane).to receive(:takeoff)

      airport.takeoff(plane)

      expect(airport.plane_count).to eq 0
    end
  end

  context "traffic control" do

    it "can be full" do
      airport = Airport.new([plane,plane,plane,plane,plane,plane])
      
      expect(airport).to be_full
    end

    it "a plane cannot land if the airport is full" do
      allow(airport).to receive(:stormy?) {false}
      6.times {airport.land(plane)}

      expect{airport.land(plane)}.to raise_error(RuntimeError)
    end
  end

  context "weather conditions" do

    before(:each) do 
      allow(airport).to receive(:stormy?) {true} 
    end

    it"will not allow a plane to take off if stormy" do
      expect{airport.takeoff(plane)}.to raise_error(RuntimeError)
    end

    it "a plane cannot land if stormy" do
      expect {airport.land(plane)}.to raise_error(RuntimeError)
    end
  end
end

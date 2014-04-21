require "airport"
require "weather"

class Airport; include Weather; end

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

describe Airport do
  
  let(:airport) { Airport.new                                  }
  let(:plane  ) { double :plane, land: :plane, takeoff: :plane }

  context "take off and landing" do
    
    it "a plane can land" do
      allow(airport).to receive(:stormy?) {false}
      
      expect(airport.plane_count).to eq 0
      expect(plane).to receive(:land)

      airport.clear_to_land(plane)
      expect(airport.plane_count).to eq 1
    end

    it "a plane can takeoff" do
      allow(airport).to receive(:stormy?) {false}
      
      expect(plane).to receive(:takeoff)

      airport.clear_to_takeoff(plane)
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
      6.times {airport.clear_to_land(plane)}

      expect{airport.clear_to_land(plane)}.to raise_error(RuntimeError)
    end
  end

  context "weather conditions" do

    it"will not allow a plane to take off if stormy" do
      allow(airport).to receive(:stormy?) {true} 

      expect{airport.clear_to_takeoff(plane)}.to raise_error(RuntimeError)
    end

    it "a plane cannot land if stormy" do
      allow(airport).to receive(:stormy?) {true}
      
      expect {airport.clear_to_land(plane)}.to raise_error(RuntimeError)
    end
  end
end
require "airport"

describe Airport do
  
  let(:airport) {Airport.new}
  let(:plane) {double :plane, land: :plane}

  it "a plane can land" do
    expect(airport.plane_count).to eq 0
    expect(plane).to receive(:land)

    airport.clear_to_land(plane)
    expect(airport.plane_count).to eq 1
  end

  it "a plane can takeoff" do
    expect(plane).to receive(:takeoff)

    airport.clear_to_takeoff(plane)
    expect(airport.plane_count).to eq 0
  end

  it "can be full" do

    expect(airport).not_to be_full

    6.times {airport.clear_to_land(plane)}

    expect(airport).to be_full

  end

  it "a plane cannot land if the airport is full" do
    6.times {airport.clear_to_land(plane)}

    expect{airport.clear_to_land(plane)}.to raise_error(RuntimeError)

  end

end
require "airport"

describe Airport do
  
  let(:airport) {Airport.new}
  let(:plane) {double :plane}

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
    plane = double :plane, land: :plane
    expect(airport).not_to be_full

    6.times {airport.clear_to_land(plane)}

    expect(airport).to be_full

  end

end
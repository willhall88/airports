require "airport"

describe Airport do
  
  it "a plane can takeoff" do

    airport = Airport.new
    plane = double :plane

    expect(plane).to receive(:takeoff)

    airport.clear_to_takeoff(plane)

  end

end
require "airport"
require "plane"
require "weather"
# grand final
# Given 6 planes, each plane must land. When the airport is full, every plane must take off again.
# Be careful of the weather, it could be stormy!
# Check when all the planes have landed that they have the right status "landed"
# Once all the planes are in the air again, check that they have the status of flying!
describe "The grand finale (last spec)" do
  it 'all planes can land and all planes can take off' do
    concorde = Plane.new
    jumbo_jet = Plane.new
    spitfire = Plane.new
    lancaster = Plane.new
    the_wright_brothers = Plane.new
    mig = Plane.new

    airport = Airport.new([concorde, jumbo_jet, spitfire, lancaster, the_wright_brothers, mig])
    expect(airport).to be_full

#take off 5 planes in good weather
    allow(airport).to receive(:stormy?) {false}
    airport.clear_to_takeoff(concorde)
    airport.clear_to_takeoff(jumbo_jet)
    airport.clear_to_takeoff(spitfire)
    airport.clear_to_takeoff(lancaster)
    airport.clear_to_takeoff(the_wright_brothers)

#weather become stormy
    allow(airport).to  receive(:stormy?) {true}
    expect{airport.clear_to_takeoff(mig)}.to raise_error(RuntimeError)
    expect(airport.plane_count).to eq 1
    expect(concorde).to be_flying
    expect(jumbo_jet).to be_flying
    expect(spitfire).to be_flying
    expect(lancaster).to be_flying
    expect(the_wright_brothers).to be_flying
    expect(mig).not_to be_flying
    expect{airport.clear_to_land(concorde)}.to raise_error(RuntimeError)

#weather is sunny again
    allow(airport).to receive(:stormy?) {false}
    airport.clear_to_takeoff(mig)
    expect(mig).to be_flying
    expect(airport.plane_count).to eq 0
    airport.clear_to_land(concorde)
    airport.clear_to_land(jumbo_jet)
    airport.clear_to_land(spitfire)
    airport.clear_to_land(lancaster)
    airport.clear_to_land(the_wright_brothers)
    airport.clear_to_land(mig)

    expect(concorde).not_to be_flying
    expect(jumbo_jet).not_to be_flying
    expect(spitfire).not_to be_flying
    expect(lancaster).not_to be_flying
    expect(the_wright_brothers).not_to be_flying
    expect(mig).not_to be_flying
    expect(airport).to be_full

  end
end
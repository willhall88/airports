require "airport"
require "plane"
require "weather"

describe "The grand finale (last spec)" do
  it 'all planes can land and all planes can take off' do
    concorde            = Plane.new
    jumbo_jet           = Plane.new
    spitfire            = Plane.new
    lancaster           = Plane.new
    the_wright_brothers = Plane.new
    mig                 = Plane.new
    airport             = Airport.new([concorde, jumbo_jet, spitfire, lancaster, the_wright_brothers, mig])
    
    expect(airport).to be_full

#take off 5 planes in good weather
    allow(airport).to receive(:stormy?) {false}
    airport.takeoff(concorde)
    airport.takeoff(jumbo_jet)
    airport.takeoff(spitfire)
    airport.takeoff(lancaster)
    airport.takeoff(the_wright_brothers)

#weather become stormy
    allow(airport).to  receive(:stormy?) {true}
    expect{airport.takeoff(mig)}.to raise_error(RuntimeError)
    expect(airport.plane_count).to eq 1
    
    expect(concorde).to be_flying
    expect(jumbo_jet).to be_flying
    expect(spitfire).to be_flying
    expect(lancaster).to be_flying
    expect(the_wright_brothers).to be_flying
    
    expect(mig).not_to be_flying
    
    expect{airport.land(concorde)}.to raise_error(RuntimeError)

#weather is sunny again
    allow(airport).to receive(:stormy?) {false}
    airport.takeoff(mig)
    
    expect(mig).to be_flying
    expect(airport.plane_count).to eq 0
   
    airport.land(concorde)
    airport.land(jumbo_jet)
    airport.land(spitfire)
    airport.land(lancaster)
    airport.land(the_wright_brothers)
    airport.land(mig)

    expect(concorde).not_to be_flying
    expect(jumbo_jet).not_to be_flying
    expect(spitfire).not_to be_flying
    expect(lancaster).not_to be_flying
    expect(the_wright_brothers).not_to be_flying
    expect(mig).not_to be_flying
    expect(airport).to be_full

  end
end
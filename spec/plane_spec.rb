require "plane"

describe Plane do 


  it "has a flying status when created" do
    plane = Plane.new

    expect(plane).not_to be_flying
  end

  it "has a status of flying once it has taken off" do
    plane = Plane.new

    plane.takeoff

    expect(plane).to be_flying
  end

end
require "plane"

describe Plane do 

  let(:plane) {Plane.new}

  it "has a flying status when created" do
    expect(plane).not_to be_flying
  end

  it "is flying once it has taken off" do
    plane.takeoff

    expect(plane).to be_flying
  end

  it "is not flying once it has landed" do
    plane.takeoff
    plane.land

    expect(plane).not_to be_flying
  end
end
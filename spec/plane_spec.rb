require "plane"

describe Plane do 


  it "has a flying status when created" do
    plane = Plane.new

    expect(plane).not_to be_flying
  end

end
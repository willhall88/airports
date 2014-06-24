require_relative "weather"

class Airport

  DEFAULT_CAPACITY = 6

  def initialize(planes = [])
    @capacity = DEFAULT_CAPACITY
    @planes = planes
  end

  def plane_count
    @planes.count
  end

  def takeoff(plane)
    raise "not clear to takeoff!" if stormy?
    plane.takeoff
    @planes.delete(plane)
  end

  def not_land
    full? || stormy?
  end

  def land(plane)
    raise "not clear to land!" if not_land
    plane.land
    @planes << plane
  end

  def full?
    plane_count == @capacity
  end
end

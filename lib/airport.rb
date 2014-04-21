require_relative "weather"

class Airport
  include Weather

  DEFAULT_CAPACITY = 6

  def initialize(planes = [])
    @capacity = DEFAULT_CAPACITY
    @planes = planes
  end

  def plane_count
    @planes.count
  end

  def clear_to_takeoff(plane)
    raise "not clear to takeoff!" if stormy?
    plane.takeoff
    @planes.delete(plane)
  end

  def not_clear_land
    full? || stormy?
  end

  def clear_to_land(plane)
    raise "not clear to land!" if not_clear_land
    plane.land
    @planes << plane
  end

  def full?
    @planes.count == @capacity
  end
end
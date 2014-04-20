class Airport
  DEFAULT_CAPACITY = 6
  def initialize(options = {})
    @capacity = options.fetch(:capacity, DEFAULT_CAPACITY)
    @planes = []
  end

  def plane_count
    @planes.count
  end

  def clear_to_takeoff(plane)
    plane.takeoff
    @planes.delete(plane)
  end

  def clear_to_land(plane)
    plane.land
    @planes << plane
  end

  def full?
    @planes.count == @capacity
  end
end
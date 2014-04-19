class Plane

  def flying?
    @flying
  end

  def takeoff
    @flying = true
  end

  def land
    @flying = false 
  end
end
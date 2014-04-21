module Weather

  def weather
    weather = rand(1..4)
    return "Stormy" if weather == 1
    return "Sunny"
  end

end
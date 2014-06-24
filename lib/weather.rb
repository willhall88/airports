class Weather

  def weather
    @random_number = rand(1..4)
  end

  def stormy?
    weather == 1
  end
end
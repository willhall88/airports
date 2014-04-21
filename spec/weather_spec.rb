require "weather"

describe Weather do
    it "can be sunny" do
      weather = double :Weather
      allow(weather).to receive(:status) { "Sunny" }
      expect(weather.status).to eq "Sunny"
    end


end
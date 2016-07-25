class FuelStation < OpenStruct

  def self.service
    FuelStationsService.new
  end

  def self.search_by_zip(params)
    raw_stations = service.search_by_zip(params)
    raw_stations["fuel_stations"].map do |raw_station|
      FuelStation.new(raw_station)
    end
  end
end

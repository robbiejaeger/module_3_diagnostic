class FuelStation < OpenStruct

  def self.service(params)
    FuelStationsService.new(params)
  end

  def self.search_by_zip(params)
    raw_stations = service(params).search_by_zip
    byebug
  end
end

class FuelStationsService

  def initialize
    @conn = Faraday.new("https://developer.nrel.gov")
    @conn.headers["X-Api-Key"] = ENV["NREL_API_KEY"]
  end

  def search_by_zip(parameters)
    response = @conn.get("/api/alt-fuel-stations/v1/nearest.json") do |req|
      req.params['location'] = parameters[:zip]
      req.params['limit'] = 10
      if parameters[:distance]
        req.params['radius'] = parameters[:distance]
      else
        req.params['radius'] = 6
      end
      req.params['fuel_type'] = "ELEC,LPG"
    end
    parse(response)
  end

  def parse(response)
    JSON.parse(response.body)
  end
end

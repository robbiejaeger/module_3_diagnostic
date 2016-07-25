class FuelStationsService

  def initialize
    @conn = Faraday.new("https://developer.nrel.gov")
    @conn.headers["X-Api-Key"] = ENV["NREL_API_KEY"]
  end

  def search_by_zip(params)
    response = @conn.get("/api/alt-fuel-stations/v1/nearest.json?location=#{params[:zip]}&limit=10")
    parse(response)
  end

  def parse(response)
    JSON.parse(response.body)
  end
end

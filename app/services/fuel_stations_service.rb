class FuelStationsService

  def initialize(params)
    @params = params
    @conn = Faraday.new(:url => 'https://api.data.gov/nrel')
    @conn.headers["X-Api-Key"] = ENV["NREL_API_KEY"]
  end

  def search_by_zip
    response = @conn.get "/alt-fuel-stations/v1/nearest.json?location=#{@params[:zip]}&limit=10"
    parse(response)
  end

  def parse(response)
    JSON.parse(response.body)
  end
end

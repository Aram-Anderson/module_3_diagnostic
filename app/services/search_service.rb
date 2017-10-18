class SearchService

  def initialize(zip)
    @zip = zip
    @conn = Faraday.new(url: "https://developer.nrel.gov") do |faraday|
  faraday.adapter Faraday.default_adapter
end
  end

  def make_stations
    parse_results.map do |result|
      Station.new(result)
    end
  end

  def parse_results
    JSON.parse(raw_results, symbolize_names: true)[:fuel_stations]
  end

  def raw_results
    conn.get("/api/alt-fuel-stations/v1/nearest.json?api_key=#{ENV["nrel_api_key"]}&location=#{zip}&radius=10&fuel_type=LPG,ELEC&limit=10").body
  end

private

attr_reader :zip, :conn
end

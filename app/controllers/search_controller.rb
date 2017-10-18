class SearchController < ApplicationController

  def index
    @stations = stations_collection.map do |station|
      Station.new(station)
    end
    stations_collection = JSON.parse(response, symbolize_names: true)[:fuel_stations]
    response = Faraday.get("https://developer.nrel.gov/api/alt-fuel-stations/v1/nearest.json?api_key=#{ENV["nrel_api_key"]}&location=80203&radius=10&fuel_type=LPG,ELEC&limit=10").body
  end

end

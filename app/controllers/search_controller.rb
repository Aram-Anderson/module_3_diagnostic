class SearchController < ApplicationController

  def index
    @stations = SearchService.new(params[:q]).make_stations
  end

end

class SearchController < ApplicationController

  def index
    @stations = FuelStation.search_by_zip(params)
  end
end

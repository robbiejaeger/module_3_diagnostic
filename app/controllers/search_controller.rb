class SearchController < ApplicationController

  def index
    FuelStation.search_by_zip(params)
  end
end

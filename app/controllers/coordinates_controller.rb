require 'open-uri'
require 'json'

class CoordinatesController < ApplicationController
  def new
    @coordinate = Coordinate.new
  end

  def create
    latitude = params['coordinate']['latitude']
    longitude = params['coordinate']['longitude']
    url = "https://api.mapbox.com/geocoding/v5/mapbox.places/museum.json?type=poi&proximity=#{latitude},#{longitude}&access_token=pk.eyJ1IjoiZHBiYWlhIiwiYSI6ImNrdmt1eDU3cTBmZWYyeG81ZDVjODVjNTMifQ.voVa-yQjGv5WxY4cXY1_ZA"
    museums_serialised = URI.open(url).read
    museums = JSON.parse(museums_serialised)

    museums["features"]
    raise

  end

  # private
  #
  # def coordinate_params
  #   params.require(:coordinate).permit(:latitude, :longitude)
  # end
end

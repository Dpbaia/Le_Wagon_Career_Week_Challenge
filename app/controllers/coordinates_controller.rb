require 'open-uri'
require 'json'

class CoordinatesController < ApplicationController
  def index
    latitude = params['lat']
    longitude = params['lng']
    url = "https://api.mapbox.com/geocoding/v5/mapbox.places/museum.json?type=poi&proximity=#{latitude},#{longitude}&access_token=pk.eyJ1IjoiZHBiYWlhIiwiYSI6ImNrdmt1eDU3cTBmZWYyeG81ZDVjODVjNTMifQ.voVa-yQjGv5WxY4cXY1_ZA"
    museums_serialised = URI.open(url).read
    museums = JSON.parse(museums_serialised)
    @hash = {}

    museums["features"].each do |museum|
      name = museum["text"]
      museum["context"].each do |info|
        if info["id"].start_with?("postcode")
          # Need to adapt above so that it looks for all the context and sees if any of them has a postcode
          # (it's not always the first one)

          postcode = info["text"]
          # pattern = /(\D*),.*\D,\D*(\d*)/
          # whole_info = museum["place_name"]
          # match_data = whole_info.match(pattern)
          # name = match_data[1]
          # postcode = match_data[2]
          if @hash.key?(postcode)
            @hash[postcode].append(name)
          else
            @hash[postcode] = [name]
          end

        end
      end


    end
  end
end

require 'rubygems'
require 'bundler/setup'

require 'metro/arrivals'
require 'faraday'

class Metro
  ENDPOINT = 'http://developer.go-metro.com'

  def arrivals
    response = connection.get("/TMGTFSRealTimeWebService/TripUpdate/")
    Arrivals.new(response.body)
  end

  private

  def connection
    connection ||= Faraday.new(url: ENDPOINT)
  end
end
